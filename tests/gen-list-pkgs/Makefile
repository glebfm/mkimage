CONFIGDIR = $(GLOBAL_CONFIGDIR)

include $(CONFIGDIR)/config.mk

MKI_PACK_RESULTS = $(GLOBAL_TEST_MKI_PACK_RESULTS)
MKI_DESTDIR = ALTLinux/RPMS.main

include $(CONFIGDIR)/targets.mk

IMAGE_PACKAGES = $(WORKDIR)/chroot/.pkglist/packages

gen-pkglist: prepare-workdir
	$(call run_scripts,$@)

gen-pkglist: MKI_SCRIPTDIR = gen-pkglist.d
copy-packages: gen-pkglist

all: gen-pkglist copy-packages run-scripts pack-image
