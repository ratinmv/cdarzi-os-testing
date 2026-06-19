#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PACKAGE_LIST="$ROOT_DIR/config/package-lists/cdarzi.list.chroot"
AUTO_CONFIG="$ROOT_DIR/auto/config"

require_file() {
  local file="$1"
  if [ ! -f "$file" ]; then
    echo "Missing required file: $file" >&2
    exit 1
  fi
}

require_text() {
  local file="$1"
  local text="$2"
  if ! rg --fixed-strings --quiet -- "$text" "$file"; then
    echo "Missing '$text' in $file" >&2
    exit 1
  fi
}

require_file "$PACKAGE_LIST"
require_file "$AUTO_CONFIG"
require_file "$ROOT_DIR/scripts/build_iso.sh"

# Boot/install support
require_text "$AUTO_CONFIG" "--binary-images iso-hybrid"
require_text "$AUTO_CONFIG" "--firmware-binary true"
require_text "$PACKAGE_LIST" "calamares"

# GUI and everyday OS basics
require_text "$PACKAGE_LIST" "kde-plasma-desktop"
require_text "$PACKAGE_LIST" "sddm"
require_text "$PACKAGE_LIST" "dolphin"
require_text "$PACKAGE_LIST" "firefox-esr"
require_text "$PACKAGE_LIST" "flatpak"

# Wi-Fi, Bluetooth, and sound
require_text "$PACKAGE_LIST" "network-manager"
require_text "$PACKAGE_LIST" "firmware-iwlwifi"
require_text "$PACKAGE_LIST" "firmware-realtek"
require_text "$PACKAGE_LIST" "firmware-brcm80211"
require_text "$PACKAGE_LIST" "pipewire"

# Gaming and programming objectives
require_text "$PACKAGE_LIST" "steam-installer"
require_text "$PACKAGE_LIST" "lutris"
require_text "$PACKAGE_LIST" "vulkan-tools"
require_text "$PACKAGE_LIST" "gamemode"
require_text "$PACKAGE_LIST" "build-essential"
require_text "$PACKAGE_LIST" "git"
require_text "$PACKAGE_LIST" "python3"
require_text "$PACKAGE_LIST" "nodejs"
require_text "$PACKAGE_LIST" "rustc"
require_text "$PACKAGE_LIST" "golang"

echo "cDarzi OS profile validation passed."
