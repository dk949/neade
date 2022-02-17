include config.mk
include detail/util.mk
include detail/configs.mk
include detail/apps.mk

ALL_CONFIG_FILES = $(addprefix $(XDG_CONFIG_HOME_NAME)/,$(CONFIGS))



all: src bin $(XDG_CONFIG_HOME_NAME)

clean:
	@rm -rf src bin logs .config

logs: logs/install.log $(AUR_INSTALL_LOG) $(PYTHON_INSTALL_LOG)
src: $(CORE_SRC) $(SECONDARY_SRC)
bin: $(SECONDARY_BIN)

$(XDG_CONFIG_HOME_NAME): $(ALL_CONFIG_FILES)

logs/install.log:
	@mkdir -p logs
	sudo pacman -S $(APPS) --needed --noconfirm
	@echo "installed $(APPS)" >> $@

$(AUR_INSTALL_LOG): src/yay
	@mkdir -p logs
	yay -S $(AUR)
	@echo "installed $(AUR)" >> $@

$(PYTHON_INSTALL_LOG): logs/install.log
	@mkdir -p logs
	pip install $(PYTHON_PACKAGES) --upgrade
	@echo "installed $(PYTHON_PACKAGES)" >> $@


src/yay: logs/install.log
	@@mkdir -p src
	git clone https://aur.archlinux.org/$(call url-part, $@, 2) $@
	cd yay && makepkg -sirc --noconfirm


$(CORE_SRC) $(SECONDARY_SRC): logs
	@mkdir -p logs
	@mkdir -p src
	git clone $(GIT_REMOTE_TYPE)dk949/$(call url-part, $@, 2) $@ --recursive
	@echo "cloned $@" >> logs/download.log
	sudo make -C $@ install
	@echo "built $@" >> logs/build.log
	@echo "installed $@" >> logs/install.log


$(SECONDARY_BIN): logs
	@mkdir -p logs
	@mkdir -p bin
	curl https://github.com/dk949/$(call url-part, $@, 2)/releases/latest/download/$(call url-part, $@, 2) -o $@ -L
	@echo "downloaded $@" >> logs/download.log
	sudo install $@
	@echo "installed $@" >> logs/install.log


$(ALL_CONFIG_FILES):
	@mkdir -p logs
	@mkdir -p $(XDG_CONFIG_HOME_NAME)
	git clone $(GIT_REMOTE_TYPE)dk949/$(call url-part, $@, 2) $@ --recursive
	@echo "cloned $@" >> logs/download.log
	@mkdir $(HOME)/$(XDG_CONFIG_HOME_NAME)
	cp -r $@ $(HOME)/$(XDG_CONFIG_HOME_NAME)


.PHONY: all clean
