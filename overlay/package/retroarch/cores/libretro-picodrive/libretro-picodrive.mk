LIBRETRO_PICODRIVE_VERSION = 7ce7374572c886862c630726febab9e6b09750f2
LIBRETRO_PICODRIVE_SITE = $(call github,libretro,picodrive,$(LIBRETRO_PICODRIVE_VERSION))

define LIBRETRO_PICODRIVE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
		$(MAKE) -C $(@D) -f Makefile.libretro
endef

define LIBRETRO_PICODRIVE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/picodrive_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/picodrive_libretro.so
endef


$(eval $(generic-package))