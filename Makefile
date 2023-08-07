PROJECT = mkimage
VERSION = $(shell sed '/^Version: */!d;s///;q' mkimage.spec)

bindir  = /usr/bin
datadir = /usr/share
DESTDIR =

prefixdir ?= $(datadir)/$(PROJECT)
ifdef MKLOCAL
prefixdir = $(CURDIR)
endif

CP = cp -a
MKDIR_P = mkdir -p
TOUCH_R = touch -r

SED = sed \
      -e 's,@VERSION@,$(VERSION),g' \
      -e 's,@PREFIXDIR@,$(prefixdir),g'

VERBOSE ?= $(V)
Q = $(if $(VERBOSE),,@)

quiet_cmd   = $(if $(VERBOSE),$(3),$(Q)printf "  %-08s%s\n" "$(1)" $(2); $(3))

EXAMPLES = \
	examples/example1/Makefile \
	examples/example1/install2/Makefile \
	examples/example1/disk/Makefile \
	examples/example1/base/Makefile \
	examples/example2/Makefile \
	examples/example2/base/Makefile \
	examples/example2/install2/Makefile \
	examples/example3/Makefile \
	examples/example3/base/Makefile \
	examples/example3/install2/Makefile \
	examples/example4/Makefile \
	examples/example4/rescue/Makefile

bin_TARGETS = bin/mkimage-reset-cache

TARGETS = actions.mk config.mk \
	config-hasher.mk config-requires.mk config-squash.mk config-propagator.mk \
	tools.mk rules.mk targets.mk $(EXAMPLES)

all: $(TARGETS) $(bin_TARGETS)

%: %.in
	$(Q)mkdir -p -- $(dir $@)
	$(call quiet_cmd,SED,$@,$(SED)) < $< > $@
	$(Q)$(TOUCH_R) $< $@
	$(Q)chmod --reference=$< $@

check: all
	$(Q)make -C tests all

install: all
	$(Q)$(MKDIR_P) -m755 $(DESTDIR)$(prefixdir) $(DESTDIR)$(bindir)
	$(Q)$(CP) -- tools $(DESTDIR)$(prefixdir)/
	$(Q)$(CP) -- *.mk $(DESTDIR)$(prefixdir)/
	$(Q)$(CP) -- bin/* $(DESTDIR)$(bindir)/

clean:
	$(Q)$(RM) $(TARGETS) *~

verify:
	$(Q)shellcheck --format=gcc --severity=info bin/* tools/mki-*
