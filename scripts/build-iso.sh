#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [[ "${EUID}" -ne 0 ]]; then
  echo "build-iso.sh must be run as root because live-build creates chroots and loopback images." >&2
  exit 1
fi

if ! command -v lb >/dev/null 2>&1; then
  echo "live-build is not installed. Install it with: apt-get install -y live-build" >&2
  exit 1
fi

mkdir -p dist
lb clean --purge || true

lb config \
  --mode debian \
  --distribution bookworm \
  --archive-areas "main contrib non-free non-free-firmware" \
  --binary-images iso-hybrid \
  --bootappend-live "boot=live components quiet splash username=cdarzi hostname=cdarzi-os locales=en_US.UTF-8 keyboard-layouts=us timezone=UTC" \
  --debian-installer live \
  --iso-application "cDarzi OS" \
  --iso-publisher "cDarzi" \
  --iso-volume "CDARZI_OS"

lb build

ISO_PATH="$(find . -maxdepth 1 -type f -name '*.iso' -print -quit)"
if [[ -z "${ISO_PATH}" ]]; then
  echo "live-build finished but no ISO was produced." >&2
  exit 1
fi
mv -f "$ISO_PATH" dist/cdarzi-os.iso
sha256sum dist/cdarzi-os.iso > dist/cdarzi-os.iso.sha256
printf 'Built %s\n' "dist/cdarzi-os.iso"
