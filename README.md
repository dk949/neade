# NEADE

NEADE stands for Not Exactly A Desktop Environment. It's built mainly on my fork
of [DWM](https://github.com/dk949/dwm), but includes other QoL applications, see
[Applications](#Applications) for details.

## <a name="Applications"></a> Applications

### Forks and stuff I wrote

* Core:
  * [dwm](https://github.com/dk949/dwm)
    * Window manager.
  * [dmenu](https://github.com/dk949/dmenu)
    * Run launcher.
  * [slstatus](https://github.com/dk949/slstatus)
    * Provides status bar information.
  * [slock](https://github.com/dk949/slock)
    * Locks teh computer without logging out he user.
* Not-so-core:
  * [dwm-scripts](https://github.com/dk949/dwm-scripts)
    * Support scripts for dwm
  * [dmenu-scripts](https://github.com/dk949/dmenu-scripts)
    * Support scripts for dmenu
* Useful(?)
  * [shellutils](https://github.com/dk949/shellutils)
    * Various shell utilities
  * [git-tools](https://github.com/dk949/git-tools)
    * like shellutils, but specifically for git
  * [formark](https://github.com/dk949/formark)
    * Markdown formatter
  * [bldr](https://github.com/dk949/bldr)
    * Tool for running other tools
  * [runc](https://github.com/dk949/runc)
    * Provides "compile-and-run" functionality for many different languages. coc
  * [vimv](https://github.com/dk949/vimv)
    * Batch renaming and deleting

### Third party

Each category (except core, drivers and AUR) can be excluded with a `NEED_*`
variable in `config.mk`. Categories can also be rewritten or appended to by
changing the variable directly in configuration.

Entries marked with `$` refer to other sections. Entries marked with `^` are
configurable in `config.mk`.

* drivers
  * ^microcode
  * ^graphics
  * linux-firmware
* core
  * ^browser
  * ^terminal
  * $drivers
  * bash-completion
  * curl
  * dash
  * dunst
  * git
  * mlocate
  * pacman-contrib
  * pcmanfm
  * picom
  * wget
  * xclip
  * xdg-user-dirs
  * xorg-server
  * xorg-xinit
  * xorg-xinput
  * xorg-xsetroot
  * zsh
* python dependencies
  * python
  * python-pip
* dev
  * $python dependencies
  * base-devel
  * clang
  * cmake
  * ctags
  * gdb
  * valgrind
* sound
* alsa-utils
* pulseaudio
* pulseaudio-alsa
* power management
  * powertop
  * tlp
  * upower
* utility
  * $power management
  * $sound
  * feh
  * figlet
  * fzf
  * htop
  * mediainfo
  * p7zip
  * pass
  * wireless\_tools
  * wmname
  * xorg-xbacklight
  * xorg-xprop
* look
  * arc-gtk-theme
  * arc-icon-theme
  * neofetch
* fonts
  * terminus-font
  * ttf-jetbrains-mono
  * xorg-fonts-type1
* fonst\_extra
  * font-bh-ttf
  * gsfonts
  * ttf-font-awesome
  * ttf-hack
  * ttf-liberation
* AUR
  * unclutter-xfixes-git
  * spaceship-prompt
* python packages
  * neovim
  * conan
