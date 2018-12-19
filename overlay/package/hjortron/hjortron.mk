################################################################################
#
# Hjortron
#
################################################################################

HJORTRON_VERSION = v0.0.1
HJORTRON_LICENSE = GPL-3.0+
HJORTRON_SOURCE=

define HJORTRON_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL_HJORTRON_PATH)/package/hjortron/inittab \
		$(TARGET_DIR)/etc/inittab
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL_HJORTRON_PATH)/package/hjortron/hjortron \
		$(TARGET_DIR)/usr/bin/hjortron

	echo "Hjortron Firmware $(HJORTRON_VERSION)" \
		> $(TARGET_DIR)/etc/issue
endef

$(eval $(generic-package))
