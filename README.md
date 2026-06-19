# cDarzi OS

cDarzi OS is a Debian Live based operating-system project focused on two goals:

1. **Gaming first**: modern GPU/Vulkan tooling, Steam/Lutris/Proton helpers, gamepad support, low-latency audio, Flatpak stores, and a friendly desktop.
2. **Programming first**: compilers, Git, containers, editors, language runtimes, terminals, and app-building tools preinstalled.

The project builds a **hybrid ISO** that can boot on **UEFI and legacy BIOS** machines and can be flashed with tools such as **Rufus**, balenaEtcher, `dd`, or Ventoy.

> This repository is a build system and OS profile. It does not claim to replace mature distributions overnight, but it provides a practical, bootable foundation for a gaming/programming desktop OS named cDarzi.

## Included desktop experience

- KDE Plasma flat GUI with SDDM login manager.
- NetworkManager Wi-Fi/Bluetooth networking applets and a broad firmware package set.
- PipeWire/WirePlumber audio stack for desktop, games, microphones, and Bluetooth audio.
- Firefox ESR browser.
- Discover and GNOME Software stores with Flatpak support.
- Dolphin file explorer, Gwenview image viewer, Spectacle screenshots, Ark archives, Kate editor, Konsole terminal, and system settings.
- Calamares graphical installer for installing from the live ISO to disk.
- Gaming packages for Steam, Lutris, Wine, Vulkan, MangoHud, GameMode, OBS, gamepad support, and GPU utilities.
- Programming packages for Git, GCC/Clang, Make/CMake/Meson/Ninja, Python, Node.js, Rust, Go, Java, Docker/Podman tooling, and database clients.

## Build requirements

Build on a Debian or Ubuntu host with `live-build` installed. Root privileges are required by live-build when creating the chroot and ISO image.

```bash
sudo apt update
sudo apt install live-build debootstrap xorriso isolinux syslinux-common squashfs-tools mtools dosfstools
```

## Build the ISO

```bash
./scripts/build_iso.sh
```

The output ISO will be written to `dist/cdarzi-os-amd64.iso` when the build completes.

## Flash/install

1. Download or build `dist/cdarzi-os-amd64.iso`.
2. Use Rufus in ISO mode or DD mode, or use balenaEtcher/Ventoy.
3. Boot the USB in UEFI or legacy BIOS mode.
4. Try the live desktop or launch the graphical installer from the desktop.

## Project layout

- `auto/config` - live-build configuration for hybrid UEFI/BIOS ISO generation.
- `config/package-lists/cdarzi.list.chroot` - cDarzi desktop, gaming, Wi-Fi, store, and developer package profile.
- `config/includes.chroot/` - files copied into the live system, including branding, wallpaper, and helper commands.
- `config/hooks/live/` - live-build hooks that finalize branding and desktop shortcuts.
- `scripts/build_iso.sh` - repeatable build wrapper.
- `docs/ROADMAP.md` - engineering roadmap for turning the profile into a fuller OS.

## Notes about Wi-Fi support

No OS can guarantee every Wi-Fi device without vendor cooperation, proprietary firmware, or kernel support. cDarzi includes NetworkManager and many common firmware packages to cover Intel, AMD/MediaTek, Atheros, Broadcom, Realtek, and USB adapters where Debian packaging permits.
