### Global variables
ifndef MKI_PREFIX
MKI_PREFIX = /usr/share/mkimage
endif

CONFIGDIR = $(MKI_PREFIX)
TOOLSDIR = $(MKI_PREFIX)/tools

### Global helpers
CHROOT_MKAPTBOX		= $(TOOLSDIR)/mki-mkaptbox
CHROOT_CACHE		= $(TOOLSDIR)/mki-cache

CHROOT_SCRIPTS		= $(TOOLSDIR)/mki-scripts
CHROOT_PREPARE 		= $(TOOLSDIR)/mki-prepare
CHROOT_PACK 		= $(TOOLSDIR)/mki-pack
CHROOT_CLEAN 		= $(TOOLSDIR)/mki-clean
CHROOT_EXEC 		= $(TOOLSDIR)/mki-exec
CHROOT_RUN 		= $(TOOLSDIR)/mki-run
CHROOT_COPY_SUBDIRS	= $(TOOLSDIR)/mki-copy-subdirs
CHROOT_COPY_PKGS	= $(TOOLSDIR)/mki-copy-pkgs
CHROOT_COPY_TREE	= $(TOOLSDIR)/mki-copy-tree
CHROOT_INSTALL		= $(TOOLSDIR)/mki-install
CHROOT_IMAGE_INSTALL	= $(TOOLSDIR)/mki-image-install

### Config global variables
TARGET = i586
QUIET =
VERBOSE = 1
NO_CACHE =

HSH_APT_CONFIG = 
HSH_APT_PREFIX = 
HSH_CACHEDIR = $(CACHEDIR)/hsh
HSH_NUMBER = 

### Per-image variables
SUBDIRS = 

MKI_SCRIPTDIR = $(CURDIR)/scripts.d

# Instrumental chroot packages list or filename with packages list.
MKI_INITROOT_REQUIRES =

# Work chroot packages list.
MKI_REQUIRES =

MKI_DESTDIR =

# Specifies a directory to copy in to $(SUBWORKDIR) as is.
MKI_DATA_TREE =

# Do not build sub chroot.
MKI_NO_SUBCHROOT =

### Pack image 
# Defines a way of results packing ($(SUBWORKDIR) as root).
#
# squash  - create a squashfs filesystem.
# tarbz2  - create a tar compessed by bzip2.
# isoboot - create a bootable ISO image.
# isodata - create a data ISO image.
# data    - copy $(SUBWORKDIR) as is.
#
MKI_PACKTYPE =

# Output image name (useful for squash, tarbz2, isoboot and isodata types).
MKI_OUTNAME =

###
### isoboot variables
###

# Modules list for propagator.
ISOBOOT_MAR_MODULES =

# Specifies a propagator initfs file. It is required for creation of file system.
ISOBOOT_INITFS =

# Specifies a propagator top message.
ISOBOOT_VERSION =

# Specifies a text string that will be written into the volume header. See: man mkisofs(8).
ISOBOOT_APPI = 

# Specifies the Copyright file name. See: man mkisofs(8).
ISOBOOT_COPY =

# Specifies the abstract file name. See: man mkisofs(8).
ISOBOOT_ABST =

# Specifies the bibliographic file name. See: man mkisofs(8).
ISOBOOT_BIBL =

# Specifies a text string that will be written into the volume header. See: man mkisofs(8).
ISOBOOT_PREP =

# Specifies  a  text  string that will be written into the volume header. See: man mkisofs(8).
ISOBOOT_PUBL =

# Specifies  the  system  ID. See: man mkisofs(8).
ISOBOOT_SYSI =

# Specifies  the  volume  ID  (volume name or label) to be written into the master block. See: man mkisofs(8).
ISOBOOT_VOLI =

# Specifies the volset ID. See: man mkisofs(8).
ISOBOOT_VOLS =
