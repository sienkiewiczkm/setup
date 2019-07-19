# Help rule thanks to https://gist.github.com/prwhite/8168133
help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

vscode-update-ext: ## update Visual Studio Code extension list
	code --list-extensions > ./config/vscode/extensions.txt

.PHONY: vscode-update-ext
