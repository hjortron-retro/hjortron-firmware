LIBRETRO_LUTRO_VERSION = b69dd3e566dfcffee17dd33049674b3d3dcd441c
LIBRETRO_LUTRO_SITE = $(call github,libretro,libretro-lutro,$(LIBRETRO_LUTRO_VERSION))

define LIBRETRO_LUTRO_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
		$(MAKE) -C $(@D) -f Makefile
endef

define LIBRETRO_LUTRO_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/lutro_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/lutro_libretro.so
endef


$(eval $(generic-package))