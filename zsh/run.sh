
SRC=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"/src"

echo "copying conf files to " $HOME

cp $SRC"/.zshrc" $HOME"/.zshrc"
cp $SRC"/.env" $HOME"/.env"
