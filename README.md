# cDarzi OS ISO Builder

This repository recreates cDarzi as a reproducible Debian Live ISO profile. It is designed to build a modern, flat-looking desktop OS while keeping the configuration small enough to audit and extend.

## Included features

- **Modern flat UI**: Xfce desktop with Materia theme, Papirus icons, small desktop icons, and a clean panel layout.
- **Wi-Fi and wired networking**: NetworkManager, iwd, ModemManager, USB tethering support, common Linux firmware bundles, WPA/WPA2/WPA3 userspace, Bluetooth, and an included Wi-Fi help launcher.
- **Connectivity alternatives**: Ethernet, Wi-Fi, Bluetooth tethering, USB phone tethering, and modem support are installed by default. Actual wireless range depends on the radio, antenna, region, obstacles, and driver/firmware; software cannot guarantee 50 m or 100 m, but this profile includes the broadest practical userspace/firmware stack for common hardware.
- **Offline browser portal**: A local start page with OS help, networking troubleshooting, app shortcuts, and offline notes opens in the browser without internet.
- **Small top-left app icons**: Desktop launchers start at the top-left and use compact icon sizing, with common apps exposed as small launchers.
- **Extra daily-driver utilities**: File manager, terminal, text editor, archive tools, screenshots, media playback, PDF viewing, calculators, USB tools, fonts, printing helpers, and diagnostics.

## Requirements

Build on Debian or Ubuntu with root privileges and these host packages:

```bash
sudo apt-get update
sudo apt-get install -y live-build xorriso isolinux syslinux-common squashfs-tools debootstrap
```

## Build the ISO

```bash
sudo ./scripts/build-iso.sh
```

The finished image is written to `dist/cdarzi-os.iso`.

## Validate the profile without building

```bash
./scripts/validate-profile.sh
```

This checks that the profile still contains the requested UI, offline browser, icon layout, and networking/Wi-Fi packages.

## Notes about Wi-Fi range

cDarzi OS can ship drivers, firmware, and network managers, but no OS can honestly guarantee a 50 m or 100 m Wi-Fi connection on every device. Range is controlled by hardware power, antenna quality, router capability, local laws, walls, interference, and band selection. For maximum range, use supported hardware with external antennas, prefer 2.4 GHz for distance, keep firmware updated, and fall back to Ethernet or USB tethering when radio conditions are poor.
