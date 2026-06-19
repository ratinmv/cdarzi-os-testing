#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST_DIR="$ROOT_DIR/dist"
ISO_NAME="cdarzi-os-amd64.iso"

cd "$ROOT_DIR"

if ! command -v lb >/dev/null 2>&1; then
  cat >&2 <<'ERROR'
live-build is required but was not found.
Install it on Debian/Ubuntu with:
  sudo apt install live-build debootstrap xorriso isolinux syslinux-common squashfs-tools mtools dosfstools
ERROR
  exit 127
fi

mkdir -p "$DIST_DIR"

echo "==> Cleaning previous live-build output"
sudo lb clean --purge || true

echo "==> Configuring cDarzi OS live-build profile"
"$ROOT_DIR/auto/config"

echo "==> Building cDarzi OS ISO (this can take a long time)"
sudo lb build

if [ ! -f live-image-amd64.hybrid.iso ]; then
  echo "Expected live-image-amd64.hybrid.iso was not produced." >&2
  exit 1
fi

mv live-image-amd64.hybrid.iso "$DIST_DIR/$ISO_NAME"
sha256sum "$DIST_DIR/$ISO_NAME" > "$DIST_DIR/$ISO_NAME.sha256"

echo "==> Built $DIST_DIR/$ISO_NAME"
echo "==> Checksum written to $DIST_DIR/$ISO_NAME.sha256"
