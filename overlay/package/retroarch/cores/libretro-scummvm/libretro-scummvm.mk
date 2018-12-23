LIBRETRO_SCUMMVM_VERSION = 20d71cd7189ae7fdd453a3041f3103bffabea13e
LIBRETRO_SCUMMVM_SITE = $(call github,libretro,scummvm,$(LIBRETRO_SCUMMVM_VERSION))

define LIBRETRO_SCUMMVM_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
		$(MAKE) -C $(@D)/backends/platform/libretro/build
endef

define LIBRETRO_SCUMMVM_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/backends/platform/libretro/build/scummvm_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/scummvm_libretro.so
endef


$(eval $(generic-package))