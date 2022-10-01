include detail/options.mk
GIT_REMOTE_TYPE=$(GIT_TYPE_HTTP)

XDG_CONFIG_HOME_NAME=$(XDG_CONFIG_DEFAULT)

DESTDIR=${HOME}/.local
PREFIX=

GRAPHICS = $(GRAPHICS_DRIVER_INTEL)
UCODE = intel-ucode

BROWSER = firefox
TERMINAL = alacritty
EDITOR = nvim
LS = exa

NEED_DEV_APPS         = 1
NEED_PY_DEPS          = 1
NEED_UTILITY          = 1
NEED_POWER_MANAGEMENT = 1
NEED_SOUND            = 1
NEED_FONTS            = 1
NEED_FONST_EXTRA      = 1
NEED_LOOK             = 1
