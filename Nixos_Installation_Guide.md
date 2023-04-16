---
title: "NixOS Installation Guide"
author: "Miya"
date: "2021-09-05"
keywords: [Linux, Nix, NixOS, Guide]
---

# NixOS

This guides assumes that you use the minimal install iso and boot using UEFI.

## Booting

Booting in Qemu:

	$ qemu-img create nix.img 20G
	$ qemu-system-x86_64 -bios /usr/share/edk2-ovmf/OVMF_CODE.fd -cdrom nixos.iso -hda nix.img -m 16G -boot order=dc -enable-kvm -smp 16

![Nix Os Grub Boot screen](assets/nixos_boot.png)

You are automatically logged in as the `nixos` user. The user has no password
set and can run any command as root using `sudo`.

First, change your keyboard layout by running `sudo loadkeys <layout>`. If the
font is too small, run `setfont ter-v32n` to increase the font size.

![Welcome to Nix](assets/nixos_welcome.png)

Run `nixos-help` at any time to open the installation manual. Navigate using
the arrow keys. Pressing <kbd>Enter</kbd> while hovering over any chapter in the
index opens that chapter.

![Nix Manual](assets/nixos_manual.png)

## Networking

Check if at least one interface is up and has an IP address associated with it.

	ip a

To connect to Wi-Fi, ensure the Wi-Fi interface is up (`ip set <interface> up`)
and then authenticate to it:

	wpa_supplicant -B -i <interface> -c < (wpa_passphrase '<SSID>' '<Password>')

Note that you might need to run both of these commands (`wpa_supplicant` and
`wpa_passphrase`) as root. Put a `sudo` in front of __both__ or get root first:
`sudo -i`.

Ensure that you are connected to the internet:

	ping -c 3 archlinux.org

## Partitioning

Crate a GPT partition table and the following partitions:

Partition | Mountpoint | Size | Type | Format
--------- | ---------- | ---- | ---- | ------
esp       | /boot      | 512MB| EFI System | vfat/fat32
root      | /          | >20GB | Linux root (x86\_64) | ext4/btrfs/zfs
swap      | -          | Same amount as RAM | Linux swap | -
home      | /home      | Rest of disk | Linux home | ext4/btrfs/zfs

If features such as hibernation are needed, swap needs to be at least as big as
there is RAM available on the system.

The separate `/home` partition is optional. Instead of a swap partition, you can
also use a swap file or leave it to systemd.

Run `fdisk -l` to list all available disks.

NOTE: Should you forget a command requires `sudo`, instead of retyping the whole
command, simply run `sudo !!`.

Partition a disk using fdisk:

	$ fdisk /dev/<disk>

![Partitioning a disk](assets/nixos_fdisk.png)

On the fdisk command line, use the following commands to partition a disk:

Command | Explanation
------- | -----------
m       | display help
g       | create a new GPT partition table
n       | create new partition
<kbd>Enter</kbd> | use default partition number
<kbd>Enter</kbd> | use default first sector
+512M   | make partition 512MiB in size
t       | change partition type
L       | list all partition types
<kbd>Esc</kbd> | exit partition types list
1       | change partition type to "EFI System" (ESP)
p       | print partition table

Create the other partitions in the same way, then exit using one of the two
options:

Command | Explanation
------- | -----------
w       | write changes to disk and exit
q       | exit without saving

## Formatting

Format the created partitions. To make the file system configuration independent
from device changes, either always make sure to use the UUID instead of path
(eg. `/dev/sda`), or assign a label (`-L <label>`) to each partition.

	$ mkfs.ext4 -L nixos_root /dev/<root>
	$ mkfs.btrfs -L nixos_home /dev/<home>
	$ mkfs.fat -F 32 -n boot /dev/<boot>    # -n instead of -L!
	$ mkswap -L swap /dev/<swap>

Check your setup by running `lsblk -af`.

## Mounting

Mount the partitions starting at `/mnt`.

	$ mount /dev/disk/by-label/nixos_root /mnt
	$ mkdir /mnt/boot # create mount points if necessary
	$ mount /dev/disk/by-label/boot /mnt/boot
	$ mkdir /mnt/home
	$ mount /dev/disk/by-label/nixos_home /mnt/home

Swap is mounted and activated in a special way:

	$ swapon /dev/<swap>

Ensure all partitions are mounted correctly:

	$ findmnt # or lsblk -af

![Partitioned, Formatted and Mounted](assets/nixos_mounted.png)

## Configuring

NixOS uses a declarative configuration model to configure the whole system. This
configuration is stored in `(/mnt)/etc/nixos/configuration.nix`. A minimal,
initial configuration can be generated using `nixos-generate-config`.

	$ nixos-generate-config --root /mnt

Edit the file as you please:

	$ EDITOR="vim" sudoedit /mnt/etc/nixos/configuration.nix

The filesystem configuration is automatically created by `nixos-generate-config`
based on the currently mounted partitions. It is found in
`(/mnt)/etc/nixos/hardware-configuration.nix`.

## Install

Install by executing:

	nixos-install

At the end of the installation, you will be asked to provide a root password.
For unattended installation, use the `--no-root-passwd` flag.

Finally, `reboot`.

![Bootmenu](assets/nixos_finished.png)

## After Install

Change your root password with `passwd` and add another user account using
`adduser`.

![That's it](assets/nixos_cong.png)
