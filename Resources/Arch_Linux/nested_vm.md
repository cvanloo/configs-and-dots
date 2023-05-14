# Nested VM with GPU pass-through

## KVM

### Check if KVM is supported.

**Hardware support**

The output should contain `AMD-V` or `VT-x`. If nothing is displayed, the CPU
does not support hardware virtualisation.

    $ lscpu | grep Virtualization

**Kernel support**

Check if `KVM` and either `KVM_AMD` or `KVM_INTEL` are available in the kernel.
The module is available if it is set to either `y` or `m`.

    $ zgrep CONFIG_KVM /proc/config.gz

Check that the kernel modules are automatically loaded.

    $ lsmod | grep kvm

### Enable Nested Virtualisation

Check if `nested` is set to `1` or `Y`.

    # systool -m kvm_amd -v | grep nested

If not already, enable the option.

    # modprobe -r kvm_amd
    # modprobe kvm_amd nested=1
    # echo "options kvm_amd nested=1" > /etc/modprobe.d/kvm_amd.conf

### CPU pass-through

Forward all CPU features to the guest.

**QEMU:** Run the guest with the following options: `-enable-kvm -cpu host`.\
**virt-manager:** Set CPU model to `host-passthrough`.\
**virsh:** Use `virsh edit vm-name` and change the CPU line to `<cpu
mode='host-passthrough' check='partial'/>`.

Boot the guest and check that the `vmx` flag is present.

    $ grep 'vmx|sxvm' /proc/cpuinfo

### Huge Pages

Check if `/dev/hugepages` exists. If not, create it.

    $ ls -lahF /dev/hugepages

Enable anyone in the `kvm` group to use huge-pages.

    # echo "hugetlbfs /dev/hugepages hugetlbfs mode=01770,gid=kvm 0 0" >>\
    /etc/fstab

Check that it is properly mounted.

    # umount /dev/hugepages
    # mount /dev/hugepages
    # mount | grep huge

Calculate how many hugepages are needed. Get the page size. It should usually
be 2048 kB (2MB).

    $ grep Hugepagesize /proc/meminfo

If the virtual machine should run with 1024MB, use 1024/2 = 512. Add a few
extra, lets round this up to 550.

    # echo 550 > /proc/sys/vm/nr_hugepages
    # grep HugePages_Total /proc/meminfo  

If there was enough free memory, the output should show `550`.

Start the guest with 1200MB memory (number\_of\_pages x 2)

    $ qemu-system-x86_64 -enable-kvm -cpu host -m 1200 -mem-path /dev/hugepages

Check how many hugepages are used while the guest is running.

    $ grep HugePages /proc/meminfo

If this all works, you can enable hugepages by default.

    # echo "vm.nr_hugepages = 550" > /etc/sysctl.d/40-hugepage.conf

## QEMU

If using btrfs, disable copy-on-write for the current directory.

    $ chattr +C dir

Create an image.

    $ qemu-img create -f raw img.raw 100G

TODO: Overlay/backing images

Install the operating system.

    $ qemu-system-x86_64 -cdrom iso_image -boot order=d -drive file=img.raw,\
    format=raw -enable-kvm -cpu host -m 1200 -smp (nproc) \
    -bios /usr/share/ovmf/x64/OVMF.fd

Run a vm.

    $ qemu-system-x86_64 -enable-kvm -cpu host -m 1200 img.raw -smp (nproc)

Check if kvm is enabled. Enter the QEMU monitor.

    $ info kvm

## Hyper-V

Enable Hyper-V enlightenments. Use `-cpu host,hv_relaxed,hv_spinlocks=0x1fff,\
hv_vapic,hv_time`

[https://wiki.archlinux.org/title/QEMU]
[https://blog.wikichoon.com/2014/07/enabling-hyper-v-enlightenments-with-kvm.html]
[https://blog.falconindy.com/articles/build-a-virtual-army.html]

## GPU Isolation

[https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Isolating_the_GPU]
[https://wiki.gentoo.org/wiki/GPU_passthrough_with_libvirt_qemu_kvm]
[https://dividebyzer0.gitlab.io/GPUpassthrough.html]

Get IOMMU groups.

```bash
#!/bin/bash

for d in /sys/kernel/iommu_groups/*/devices/*; do
  n=${d#*/iommu_groups/*}; n=${n%%/*}
  printf 'IOMMU Group %s ' "$n"
  lspci -nns "${d##*/}"
done
```

In the output, locate the GPU and its Audio device to be used for pass-through.

```
IOMMU Group 29 0b:00.0 VGA compatible controller [0300]: NVIDIA Corporation\
TU102 [GeForce RTX 2080 Ti Rev. A] [10de:1e07] (rev a1)
IOMMU Group 29 0b:00.1 Audio device [0403]: NVIDIA Corporation TU102 High\
Definition Audio Controller [10de:10f7] (rev a1)
```

Make sure that their group IDs are different from the group IDs of the GPU of
the host. If not, you need to apply this patch:

    $ paru -Syu linux-vfio

Note down their ids (the hex numbers in the brackets at the end of the lines),
e.g. `10de:10f7` and `10de:1e07`.

Add the following values to the kernel command line (in your bootloader).
Replace `amd_iommu` with `intel_iommu` if you use an Intel CPU.

```
amd_iommu=on iommu=pt isolcpus=2-7 nohz_full=2-7 rcu_nocbs=2-7 \
transparent_hugepage=never rd.driver.rpe=vfio-pci vfio \
pci-ids=10de:10f7,10de:1e07 pcie_acs_override=downstream,multifunction
```

* isolcpus - isolate CPU cores from the host to use explicitly in the VM
* nohz\_full - stop the CPUs tick whenever possible
* rcu\_nocbs - allow the user to move all RCU offload threats to hosekeeping
  cores
* transparent\_hugepage - disable transparent huge pages, allowing for faster
  memory access for the VM
* pcie\_acs\_override - enables the kernel patch from earlier (only use this if
  you needed the patch)
