PROJECT = mkimage
VERSION = $(shell sed '/^Version: */!d;s///;q' mkimage.spec)

bindir  = /usr/bin
datadir = /usr/share
DESTDIR =

CP = cp -a
MKDIR_P = mkdir -p
TOUCH_R = touch -r

prefixdir ?= $(datadir)/$(PROJECT)

ifdef MKLOCAL
prefixdir = $(CURDIR)
endif

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
	sed \
		-e 's,@VERSION@,$(VERSION),g' \
		-e 's,@PREFIXDIR@,$(prefixdir),g' \
		<$< >$@
	$(TOUCH_R) $< $@
	chmod --reference=$< $@

check: all
	make -C tests all

install: all
	$(MKDIR_P) -m755 $(DESTDIR)$(prefixdir) $(DESTDIR)$(bindir)
	$(CP) -- tools $(DESTDIR)$(prefixdir)/
	$(CP) -- *.mk $(DESTDIR)$(prefixdir)/
	$(CP) -- bin/* $(DESTDIR)$(bindir)/

clean:
	$(RM) $(TARGETS) *~

verify:
	@shellcheck --format=gcc --severity=info bin/* tools/mki-*
