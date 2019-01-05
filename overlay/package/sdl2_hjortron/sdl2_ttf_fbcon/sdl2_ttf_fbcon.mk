################################################################################
#
# sdl2_ttf_fbcon
#
################################################################################

SDL2_TTF_FBCON_VERSION = 2.0.14
SDL2_TTF_FBCON_SOURCE = SDL2_ttf-$(SDL2_TTF_FBCON_VERSION).tar.gz
SDL2_TTF_FBCON_SITE = http://www.libsdl.org/projects/SDL_ttf/release
SDL2_TTF_FBCON_LICENSE = Zlib
SDL2_TTF_FBCON_LICENSE_FILES = COPYING.txt
SDL2_TTF_FBCON_INSTALL_STAGING = YES
SDL2_TTF_FBCON_DEPENDENCIES = sdl2_fbcon freetype host-pkgconf

# Two patches touching configure.in
SDL2_TTF_FBCON_AUTORECONF = YES

SDL2_TTF_FBCON_CONF_ENV = \
	FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config

SDL2_TTF_FBCON_CONF_OPTS += --without-x

$(eval $(autotools-package))
