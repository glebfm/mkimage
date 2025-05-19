CONFIGDIR = $(GLOBAL_CONFIGDIR)

include $(CONFIGDIR)/config.mk

CHROOT_PACKAGES = $(GLOBAL_TEST_CHROOT_PACKAGES)
MKI_PACK_RESULTS = $(GLOBAL_TEST_MKI_PACK_RESULTS)

BOOT_TYPE = $(GLOBAL_TEST_BOOT_TYPE)

include $(CONFIGDIR)/targets.mk

EFI_CERT = $(GLOBAL_TEST_EFI_CERT)

ifeq ($(GLOBAL_TEST_NAME),boot-simple-isolinux.iso)

COPY_TREE = ./isolinux
all: copy-tree pack-image

else ifeq ($(GLOBAL_TEST_NAME),boot-simple-efiboot-grub-efi.iso)

COPY_TREE = ./grub-efi-files
all: copy-tree pack-image

else ifeq ($(GLOBAL_TEST_NAME),boot-simple-efiboot-grub-efi+sb.iso)

COPY_TREE = ./grub-efi-files
all: copy-tree pack-image

else ifeq ($(GLOBAL_TEST_NAME),boot-simple-hybrid-grubpc-efiboot-grub-efi.iso)

COPY_TREE = ./grub-efi-files
all: copy-tree pack-image

else ifeq ($(GLOBAL_TEST_NAME),boot-simple-hybrid-grubpc-efiboot-grub-efi+sb.iso)

COPY_TREE = ./grub-efi-files
all: copy-tree pack-image

else ifeq ($(GLOBAL_TEST_NAME),boot-simple-hybrid-isolinux-efiboot-grub-efi.iso)

COPY_TREE = ./isolinux ./grub-efi-files
MKI_SCRIPTDIR = hybrid-isolinux-efiboot-scripts.d
all: copy-tree run-scripts pack-image

else ifeq ($(GLOBAL_TEST_NAME),boot-simple-hybrid-isolinux-efiboot-grub-efi+sb.iso)

COPY_TREE = ./isolinux ./grub-efi-files
MKI_SCRIPTDIR = hybrid-isolinux-efiboot-scripts.d
all: copy-tree run-scripts pack-image

else

all: pack-image

endif
