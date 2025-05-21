.NOTPARALLEL:
.EXPORT_ALL_VARIABLES:

export GLOBAL_WORKROOT = $(TMPDIR)
export GLOBAL_PREFIX = $(shell dirname $(CURDIR))
export GLOBAL_CONFIGDIR = $(GLOBAL_PREFIX)
DRIVER = $(CURDIR)/test-image

#
# NOTE: don't forget to sync this list with the .github/workflows/ci.yml .
#
TESTS = \
	files.cpio \
	files.data \
	files.iso \
	files.squash \
	files.tar \
	files.tar.bz2 \
	files.tar.gz \
	files.tar.lz4 \
	files.tar.xz \
	files.tar.zst \
	subdir.cpio \
	subdir.data \
	subdir.iso \
	subdir.squash \
	subdir.tar \
	pkgs-main.cpio \
	pkgs-main.data \
	pkgs-main.iso \
	pkgs-main.squash \
	pkgs-main.tar \
	pkgs.cpio \
	pkgs.data \
	pkgs.iso \
	pkgs.squash \
	pkgs.tar \
	run-scripts-custom.data \
	boot-simple-isolinux.iso \
	boot-simple-grubpc.iso \
	boot-simple-pxelinux.data \
	boot-simple-syslinux.data \
	boot-simple-efiboot-grub-efi+sb.iso \
	boot-simple-efiboot-grub-efi.iso \
	boot-simple-hybrid-grubpc-efiboot-grub-efi+sb.iso \
	boot-simple-hybrid-grubpc-efiboot-grub-efi.iso \
	boot-simple-hybrid-isolinux-efiboot-grub-efi+sb.iso \
	boot-simple-hybrid-isolinux-efiboot-grub-efi.iso \
	#

.PHONY: $(TESTS) check all distclean

check: $(TESTS)

all: check

distclean: $(TESTS)

$(TESTS):
	$(DRIVER) "$@" $(MAKECMDGOALS)
