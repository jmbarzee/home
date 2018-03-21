TEMP_DIR="../temp"
echo "downloading nessecarry files into $TEMP_DIR"

APPS_DIR=$HOME"/Applications"
echo "placing apps into $APPS_DIR"

mkdir $TEMP_DIR
cd $TEMP_DIR

# Downloads
URLS=( \
  "https://download.scdn.co/SpotifyInstaller.zip" \
  "https://downloads.slack-edge.com/mac_releases/Slack-3.1.0.dmg" \
  "https://dl.google.com/chrome/mac/stable/CHFA/googlechrome.dmg" \
  "https://iterm2.com/downloads/stable/iTerm2-3_1_5.zip" \
  "https://az764295.vo.msecnd.net/stable/79b44aa704ce542d8ca4a3cc44cfca566e7720f1/VSCode-darwin-stable.zip" \
  )

for URL in $URLS; do
  curl -O $URL
done



