DRIVERS = linux-firmware \
		  $(UCODE) \
		  $(GRAPHICS)

CORE_APPS =	$(DRIVERS) \
			$(TERMINAL) \
			bash-completion \
			curl \
			dash \
			dunst \
			$(BROWSER) \
			git \
			mlocate \
			pacman-contrib \
			pcmanfm \
			picom \
			wget \
			xclip \
			xdg-user-dirs \
			xorg-server \
			xorg-xinit \
			xorg-xinput \
			xorg-xsetroot \
			zsh

PY_DEPS = python python-pip

DEV_APPS =  $(call add,PY_DEPS) \
			base-devel \
			clang \
			cmake \
			ctags \
			gdb \
			valgrind

SOUND = alsa-utils \
		pulseaudio \
		pulseaudio-alsa


POWER_MANAGEMENT = powertop \
				   tlp \
				   upower

UTILITY = $(call add,POWER_MANAGEMENT) \
		  $(call add,SOUND) \
		  feh \
		  figlet \
		  fzf \
		  htop \
		  mediainfo \
		  p7zip \
		  pass \
		  wireless_tools \
		  wmname \
		  xorg-xbacklight \
		  xorg-xprop


LOOK = arc-gtk-theme \
	   arc-icon-theme \
	   neofetch

FONTS =	terminus-font \
		ttf-jetbrains-mono \
		xorg-fonts-type1

FONST_EXTRA = gsfonts \
			  ttf-font-awesome \
			  ttf-hack \
			  ttf-liberation

APPS = $(CORE_APPS) \
	   $(call add,DEV_APPS) \
	   $(call add,UTILITY) \
	   $(call add,LOOK) \
	   $(call add,FONTS) \
	   $(call add,FONST_EXTRA)

AUR = unclutter-xfixes-git \
	  spaceship-prompt

AUR_INSTALL_LOG = $(if $(AUR),logs/aurinstall.log,)

PYTHON_PACKAGES = neovim conan

# Only install python packages if they are specified and if python dependencies are required
PYTHON_INSTALL_LOG = $(if $(PYTHON_PACKAGES),$(if $(PY_DEPS),logs/pyinstall.log,),)

CORE_SRC = src/dwm src/dmenu src/slstatus src/slock src/dwm-scripts src/dmenu-scripts

SECONDARY_SRC = src/shellutils src/git-tools src/runc src/vimv

SECONDARY_BIN = bin/formark bin/bldr
