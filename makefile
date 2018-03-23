.PHONY: all
.PHONY: apple apple-brew apple-chrome apple-iterm2 apple-slack apple-spotify apple-vscode apple-xcode apple-yarn
.PHONY: linux linux-confs

all: apple linux
	echo "installing everything. This might be a bad idea"


apple: apple-brew apple-chrome apple-iterm2 apple-slack apple-spotify apple-vscode apple-xcode apple-yarn
	echo "installing all apple components"

apple-brew:
	./apple/brew/run.sh
apple-chrome:
	./apple/chrome/run.sh
apple-iterm2:
	./apple/iterm2/run.sh
apple-slack:
	./apple/slack/run.sh
apple-spotify:
	./apple/spotify/run.sh
apple-vscode: apple-xcode apple-brew apple-yarn
	./apple/vscode/run.sh
apple-xcode:
	./apple/xcode/run.sh
apple-yarn: apple-brew
	./apple/yarn/run.sh

linux: linux-confs
	echo "installing all linux components"

linux-confs:
	./linux/confs/run.sh
