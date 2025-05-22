# Help rule thanks to https://gist.github.com/prwhite/8168133
help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

git:
	test -f packages/git/.config/git/secrets.gitconfig || cp packages/git/secrets.template.gitconfig packages/git/.config/git/secrets.gitconfig

git-stow: git ## installs git dotfiles
	stow git -d packages -t ~ --verbose

aerospace-stow: git ## installs aerospace dotfiles
	stow aerospace -d packages -t ~ --verbose

vscode-macos-stow: ## installs vscode dotfiles (MacOS only)
	stow vscode -d packages -t ~/Library/Application\ Support/Code/User/ --verbose

vscode-extensions-save: ## update Visual Studio Code extension list (extensions.txt)
	@code --list-extensions > ./packages/vscode/extensions.txt

vscode-extensions-install: ## installs Visual Studio Code extensions listed in extensions.txt file
	@cat ./packages/vscode/extensions.txt | xargs -L1 code --install-extension

.PHONY: help vscode-macos-stow vscode-extensions-save vscode-extensions-install
