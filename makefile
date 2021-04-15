.PHONY: all
.PHONY: brew chrome iterm2 slack spotify vscode xcode yarn

all: brew chrome iterm2 slack spotify vscode xcode yarn
	echo "installing everything. This might be a bad idea"

brew:
	./brew/install.sh
chrome:
	./chrome/install.sh
iterm2:
	./iterm2/install.sh
slack:
	./slack/install.sh
spotify:
	./spotify/install.sh
vscode: xcode brew yarn
	./vscode/install.sh
xcode:
	./xcode/install.sh
yarn: brew
	./yarn/install.sh