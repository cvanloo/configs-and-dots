# Full-Disk Encryption

```sh
fdisk /dev/nvme0n1
# g

# n
# +500M
# t
# 1 (EFI System)

# n
# (max available)
# t
# (Linux root x86_64)

# w
```


```sh
cryptsetup luksFormat /dev/nvme0n1p2
cryptsetup open /dev/nvme0n1p2 cryptlvm

pvcreate /dev/mapper/cryptlvm
vgcreate System /dev/mapper/cryptlvm

lvcreate -L 8G System -n swap
lvcreate -L 100G System -n root
lvcreate -l 100%FREE System -n home
lvcreate -L -256M System/home
```

```sh
mkfs.ext4 /dev/System/root
mkfs.ext4 /dev/System/home
mkswap /dev/System/swap
```

```sh
mount /dev/System/root /mnt
mount --mkdir /dev/System/home /mnt/home
swapon /dev/System/swap
```

```sh
mkfs.fat -F32 /dev/nvme0n1p1
mount --mkdir /dev/nvme0n1p1 /mnt/boot
```

Continue installation as normal, then come back here, before setting up the
bootloader.

```
sudoedit /etc/mkinitcpio.conf
---
HOOKS=(... udev ... keyboard keymap ... encrypt lvm2 ...)
```

```sh
mkinitcpio -p linux
```

In the bootloader, configure:

```
options cryptdevice=UUID=<root-uuid>:cryptlvm root=/dev/System/root rw
```
