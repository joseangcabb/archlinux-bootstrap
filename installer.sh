#!/bin/bash
set -e

export PROJECT_DIR=$(pwd)
export SCRIPTS="${PROJECT_DIR}/scripts"

export TEMP_INSTALLATION_FILE="temp_installation_file.sh"

main() {
  bash "${SCRIPTS}/disk.sh"
  bash "${SCRIPTS}/base_system.sh"

  # Installation within the chroot context 
  bash "${SCRIPTS}/build_installer.sh"
  arch-chroot /mnt /bin/bash -c "bash ${TEMP_INSTALLATION_FILE}"

  # Remove temporary installation files
  rm "/mnt/${TEMP_INSTALLATION_FILE}"

  # Unmount all partitions before rebooting
  umount -R /mnt
  reboot
}
  
main
