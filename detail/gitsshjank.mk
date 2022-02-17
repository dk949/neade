GIT_CONFIG_LOC = $(HOME)/.gitconfig
ifeq ($(GIT_REMOTE_TYPE),$(GIT_TYPE_HTTP))
	GIT_SSH_FIX = $(GIT_CONFIG_LOC)
endif


$(GIT_SSH_FIX):
	@printf '[url "https://github.com/"]\n\tinsteadOf = git@github.com:' >> $(GIT_SSH_FIX)


clean-git-ssh-fix = $(if $(GIT_SSH_FIX),rm -f $(GIT_CONFIG_LOC),)
