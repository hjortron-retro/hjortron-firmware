LIBRETRO_2048_VERSION = bde4a6e130c15775f340affda3c870451c0434e2
LIBRETRO_2048_SITE = $(call github,libretro,libretro-2048,$(LIBRETRO_2048_VERSION))

define LIBRETRO_2048_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
		$(MAKE) -C $(@D) -f Makefile.libretro
endef

define LIBRETRO_2048_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/2048_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/2048_libretro.so
endef


$(eval $(generic-package))