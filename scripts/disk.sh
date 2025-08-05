#!/bin/bash
set -e

source "${PROJECT_DIR}/config.sh"

echo "DISK"

echo ">>>Cleaning up existing partitions..."
# Check if /mnt is already mounted and unmount if necessary.
if mount | grep -q "/mnt"; then
  umount -R /mnt
fi

# Disable any active swap space.
swapoff -a

# Wipe existing partitions.
sgdisk --zap-all ${DISK}
wipefs --all ${DISK}

echo ">>> Creating partitions..."
sgdisk ${DISK} --new=1:0:+${EFI_SIZE} --typecode=1:ef00 --change-name=1:EF_System
sgdisk ${DISK} --new=2:0:+${ROOT_SIZE} --typecode=2:8300 --change-name=2:Root_Filesystem
sgdisk ${DISK} --new=3:0:+${SWAP_SIZE} --typecode=3:8200 --change-name=3:Swap_Space
sgdisk ${DISK} --new=4:0: --typecode=4:8300 --change-name=4:Home_Directory

# Synchronize kernel partition table.
partprobe ${DISK}

echo ">>> Formatting partitions..."
mkfs.fat -F32 ${DISK}1
mkfs.ext4 -F ${DISK}2
mkfs.ext4 -F ${DISK}4

# Setup and enable swap.
mkswap -f ${DISK}3
swapon ${DISK}3

echo ">>> Mounting partitions..."
mount ${DISK}2 /mnt
mkdir -p /mnt/boot/efi && mount ${DISK}1 /mnt/boot/efi
mkdir -p /mnt/home && mount ${DISK}4 /mnt/home

echo ">>> Partitions..."
lsblk -o NAME,FSTYPE,MOUNTPOINT,SIZE -n ${DISK}
