

install:
	@maintain-install.sh
.PHONY: install


remove:
	@maintain-remove.sh
.PHONY: remove


completion-install:
	@maintain-install-completion.sh
.PHONY: completion-install
