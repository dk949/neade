url-part = $(word $2,$(subst /, ,$1))
add = $(if $(NEED_$(1)), $($(1)), )
