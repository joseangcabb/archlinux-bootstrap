#!/bin/bash
set -e

echo "BASE SYSTEM"

echo ">>> Installing base packages..."
# Install base packages including development tools and firmware 
pacstrap /mnt base base-devel linux linux-firmware > /dev/null 2>&1

echo ">>> Generating /etc/fstab..."
# The 'genfstab' generates the /etc/fstab file, which defines how partitions should be mounted
# The -U option ensures that UUIDs are used instead of device names (e.g., /dev/sda1),
# making the system more stable against disk order changes.
genfstab -U /mnt >> /mnt/etc/fstab
