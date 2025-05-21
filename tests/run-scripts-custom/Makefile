CONFIGDIR = $(GLOBAL_CONFIGDIR)

include $(CONFIGDIR)/config.mk

MKI_PACK_RESULTS = $(GLOBAL_TEST_MKI_PACK_RESULTS)

include $(CONFIGDIR)/targets.mk

run-scripts-custom: prepare-workdir
	$(call run_scripts,$@)

run-scripts-custom: MKI_SCRIPTDIR = my-scripts-custom.d
run-scripts: MKI_SCRIPTDIR = my-scripts.d

run-scripts: run-scripts-custom

all: run-scripts-custom run-scripts pack-image
