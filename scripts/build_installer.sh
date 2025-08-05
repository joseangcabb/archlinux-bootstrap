#!/bin/bash
set -e

echo "BUILD INSTALLER"

MODULE_FILES=(
  "timezone.sh"
  "locale.sh"
  "hostname.sh"
  "users.sh"
  "bootloader.sh"
  "services.sh"
)

echo ">>> Creating temporary installation file..."
{
  echo "#!/bin/bash"
  set -e

  # Copy config variables.
  cat "${PROJECT_DIR}/config.sh"

  # Join chroot/ files.
  for module in "${MODULE_FILES[@]}"; do
    cat "${SCRIPTS}/chroot/${module}"
  done
} > "/mnt/${TEMP_INSTALLATION_FILE}"
