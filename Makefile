include util.mk
include config.mk
include apps.mk

all: src bin $(XDG_CONFIG_HOME)

clean:
	@rm -r src bin logs

logs: logs/install.log $(AUR_INSTALL_LOG) $(PYTHON_INSTALL_LOG)
src: $(CORE_SRC) $(SECONDARY_SRC)
bin: $(SECONDARY_BIN)
$(XDG_CONFIG_HOME): $(XDG_CONFIG_HOME)/$(CONFIGS)


logs/install.log:
	@mkdir -p logs
	@echo sudo pacman -S $(APPS) --needed --noconfirm
	@echo "installed $(APPS)" >> $@

$(AUR_INSTALL_LOG): src/yay
	@mkdir -p logs
	@echo yay -S $(AUR)
	@echo "installed $(AUR)" >> $@

$(PYTHON_INSTALL_LOG): logs/install.log
	@mkdir -p logs
	@echo pip install $(PYTHON_PACKAGES) --upgrade
	@echo "installed $(PYTHON_PACKAGES)" >> $@


src/yay: logs/install.log
	@mkdir -p src
	@echo git clone https://aur.archlinux.org/$(call url-part, $@, 2) $@
	@echo cd yay && echo makepkg -sirc --noconfirm


$(CORE_SRC) $(SECONDARY_SRC): logs
	@mkdir -p logs
	@mkdir -p src
	@echo git clone $(GIT_REMOTE_TYPE)dk949/$(call url-part, $@, 2) $@ --recursive
	@echo "cloned $@" >> logs/download.log
	@echo sudo make -C $@ install
	@echo "built $@" >> logs/build.log
	@echo "installed $@" >> logs/install.log


$(SECONDARY_BIN): logs
	@mkdir -p logs
	@mkdir -p bin
	@echo curl https://github.com/dk949/$(call url-part, $@, 2)/releases/latest/download/$(call url-part, $@, 2) -o $@ -L
	@echo "downloaded $@" >> logs/download.log
	@echo sudo install $@
	@echo "installed $@" >> logs/install.log

$(XDG_CONFIG_HOME)/$(CONFIGS):
	@mkdir -p logs
	@mkdir -p $(XDG_CONFIG_HOME)
	@echo git clone $(GIT_REMOTE_TYPE)dk949/$(call url-part, $@, 2) $@ --recursive
	@echo "cloned $@" >> logs/download.log


.PHONY: all clean system
