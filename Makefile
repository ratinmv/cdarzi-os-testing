.PHONY: validate iso

validate:
	bash -n scripts/build_iso.sh scripts/validate_profile.sh auto/config config/hooks/live/001-cdarzi-branding.chroot config/hooks/live/010-cdarzi-desktop-shortcuts.chroot
	./scripts/validate_profile.sh

iso:
	./scripts/build_iso.sh
