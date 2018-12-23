LIBRETRO_YABAUSE_VERSION = dbbda0f3a65badb2b4197438855be28ddfefdbe0
LIBRETRO_YABAUSE_SITE = $(call github,libretro,yabause,$(LIBRETRO_YABAUSE_VERSION))

define LIBRETRO_YABAUSE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
		$(MAKE) -C $(@D)/libretro
endef

define LIBRETRO_YABAUSE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/libretro/yabause_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/yabause_libretro.so
endef


$(eval $(generic-package))