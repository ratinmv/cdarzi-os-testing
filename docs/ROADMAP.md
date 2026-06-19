# cDarzi OS Roadmap

## Milestone 1: Bootable gaming/programming ISO

- Maintain the Debian Live profile in this repository.
- Produce hybrid ISO images for UEFI, BIOS, Rufus, Ventoy, Etcher, and `dd` workflows.
- Keep KDE Plasma as the default flat GUI so the live system is not raw text.
- Include Calamares for graphical disk installation.

## Milestone 2: Hardware enablement

- Track current Linux kernels from Debian backports where possible.
- Include non-free firmware packages for common Wi-Fi and GPU devices.
- Add smoke tests for NetworkManager, Bluetooth, PipeWire, Vulkan, and game controllers.
- Document hardware that still needs out-of-tree drivers.

## Milestone 3: Gaming experience

- Preinstall Steam installer, Lutris, Wine, Protontricks, GameMode, MangoHud, Gamescope, OBS, and Vulkan tools.
- Add first-run guidance for installing Proton-GE, Heroic Games Launcher, and emulators through Flatpak.
- Tune optional gaming profiles without breaking laptop battery life.

## Milestone 4: Programming experience

- Preinstall compilers, debuggers, Git, language runtimes, package managers, and container tooling.
- Add project templates for native apps, web apps, and game prototypes.
- Add documentation for building Android, web, Rust, Python, Node.js, Go, Java, and C/C++ apps.

## Milestone 5: cDarzi identity

- Replace placeholder wallpaper and branding with a complete theme.
- Add a graphical welcome center.
- Add release signing, reproducible build notes, automated ISO checks, and upgrade documentation.
