CONFIGDIR = $(GLOBAL_CONFIGDIR)

include $(CONFIGDIR)/config.mk

MKI_PACK_RESULTS = $(GLOBAL_TEST_MKI_PACK_RESULTS)

MKI_HANDLER = $(CURDIR)/pack.sh
MKI_PACK_RESULTS = custom:run-image-scripts-custom.data:$(MKI_HANDLER)

include $(CONFIGDIR)/targets.mk

run-image-scripts-custom: prepare-image-workdir
	$(call run_image_scripts,$@)

run-image-scripts-custom: MKI_IMAGE_SCRIPTDIR = my-image-scripts-custom.d
run-image-scripts: MKI_IMAGE_SCRIPTDIR = my-image-scripts.d

run-image-scripts: run-image-scripts-custom

all: build-image run-image-scripts-custom run-image-scripts pack-image
