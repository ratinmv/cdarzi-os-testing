#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

require_file() {
  local path="$1"
  [[ -f "$path" ]] || { echo "Missing required file: $path" >&2; exit 1; }
}

require_text() {
  local path="$1"
  local text="$2"
  require_file "$path"
  if ! rg --fixed-strings --quiet "$text" "$path"; then
    echo "Missing '$text' in $path" >&2
    exit 1
  fi
}

require_text config/package-lists/cdarzi-desktop.list.chroot "network-manager"
require_text config/package-lists/cdarzi-desktop.list.chroot "iwd"
require_text config/package-lists/cdarzi-desktop.list.chroot "firmware-linux"
require_text config/package-lists/cdarzi-desktop.list.chroot "materia-gtk-theme"
require_text config/package-lists/cdarzi-desktop.list.chroot "papirus-icon-theme"
require_text config/includes.chroot/etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml "Materia"
require_text config/includes.chroot/etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml "icon-size"
require_text config/includes.chroot/usr/local/share/cdarzi/offline-portal/index.html "Offline Browser Portal"
require_text config/hooks/normal/020-networking-services.hook.chroot "NetworkManager.service"

for launcher in offline-portal network-help file-manager terminal browser; do
  require_file "config/includes.chroot/etc/skel/Desktop/${launcher}.desktop"
done

echo "cDarzi ISO profile validation passed."
