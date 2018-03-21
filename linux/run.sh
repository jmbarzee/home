
SRC=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"/src"

echo "copying linux conf files to " $HOME

cp $SRC"/bash_profile" $HOME"/.bash_profile"
cp $SRC"/vimrc" $HOME"/.vimrc"
