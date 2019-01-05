################################################################################
#
# sdl2_fbcon
#
################################################################################

SDL2_FBCON_VERSION = 2.0.8
SDL2_FBCON_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
SDL2_FBCON_SITE = http://www.libsdl.org/release
SDL2_FBCON_LICENSE = Zlib
SDL2_FBCON_LICENSE_FILES = COPYING.txt
SDL2_FBCON_INSTALL_STAGING = YES
SDL2_FBCON_CONFIG_SCRIPTS = sdl2-config
SDL2_FBCON_DEPENDENCIES = alsa-lib
SDL2_FBCON_CONF_OPTS += \
	--disable-rpath \
	--disable-arts \
	--disable-esd \
	--disable-dbus \
	--disable-input-tslib \
	--disable-pulseaudio \
	--disable-video-vulkan \
	--disable-video-opengl \
	--disable-video-opengles \
	--disable-video-kmsdrm \
	--disable-video-directfb \
	--disable-video-x11 \
	--disable-video-mir \
	--disable-video-wayland \
	--disable-video-rpi \
	--enable-video-fbcon \
	--enable-video \
	--enable-alsa \
	--enable-libudev \
	--disable-threads

# One patches touching configure.in
SDL2_FBCON_AUTORECONF = YES


# We must enable static build to get compilation successful.
SDL2_FBCON_CONF_OPTS += --enable-static

$(eval $(autotools-package))
