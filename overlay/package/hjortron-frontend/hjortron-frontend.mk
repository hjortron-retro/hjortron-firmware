################################################################################
#
# Hjortron Frontend
#
################################################################################

HJORTRON_FRONTEND_VERSION = 4793a1cd32f1a8298b89441aee615eabb23b00ff
HJORTRON_FRONTEND_SITE = $(call github,hjortron-retro,hjortron-frontend,$(HJORTRON_FRONTEND_VERSION))
HJORTRON_FRONTEND_DEPENDENCIES = sdl2_fbcon sdl2_ttf_fbcon alsa-lib jansson sqlite

define HJORTRON_FRONTEND_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
		$(MAKE) -C $(@D)
endef

define HJORTRON_FRONTEND_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/src/hjortron-frontend \
		$(TARGET_DIR)/usr/bin/hjortron-frontend
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL_HJORTRON_PATH)/package/hjortron-frontend/hjortron.conf \
		$(TARGET_DIR)/etc/hjortron.conf
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL_HJORTRON_PATH)/package/hjortron-frontend/font.ttf \
		$(TARGET_DIR)/usr/share/hjortron/font.ttf

endef

$(eval $(generic-package))
