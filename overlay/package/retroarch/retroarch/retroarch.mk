################################################################################
#
# RetroArch
#
################################################################################

RETROARCH_VERSION = v1.7.5
RETROARCH_SITE = $(call github,libretro,RetroArch,$(RETROARCH_VERSION))
RETROARCH_LICENSE = GPL-3.0+
RETROARCH_LICENSE_FILES = COPYING
RETROARCH_DEPENDENCIES = sdl sdl_image sdl_gfx sdl_net sdl_ttf eudev libzlib libogg libvorbis openal


define RETROARCH_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
		$(MAKE) -C $(@D) -f Makefile.buildroot
endef

define RETROARCH_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/retroarch_buildroot \
		$(TARGET_DIR)/usr/bin/retroarch
endef

$(eval $(generic-package))
