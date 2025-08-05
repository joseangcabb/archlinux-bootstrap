# Configuration variables for the Arch Linux Bootstrap installer.

# Target disk for installation (e.g. /dev/sda)
# You can view available disks with the 'lsblk' command.
DISK=""

# The desired hostname for the installed system.
HOSTNAME=""

# The system's timezone (e.g America/New_York).
TIMEZONE=""

# System language and encoding (locale).
LANG="en_US.UTF-8"

# EFI system partition size (e.g., 300M, 512M).
EFI_SIZE="500M"

# Swap partition size (e.g., 4G, 8G).
SWAP_SIZE="8G"

# Root partition size (e.g., 50G, 150G).
ROOT_SIZE="150G"

# Root user password.
ROOT_PASSWORD=""

# Username for the non-root user.
USER_NAME=""

# Password for the non-root user.
USER_PASSWORD=""
