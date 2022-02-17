GIT_CONFIG_LOC = $(HOME)/.gitconfig
ifeq ($(GIT_REMOTE_TYPE),$(GIT_TYPE_HTTP))
	GIT_SSH_FIX = $(GIT_CONFIG_LOC)
endif


clean-git-ssh-fix = $(if $(GIT_SSH_FIX),rm -f $(GIT_CONFIG_LOC),)
