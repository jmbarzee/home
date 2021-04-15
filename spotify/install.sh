#!/bin/sh

set -e
set -u

TEMP_DIR="temp/"
mkdir $TEMP_DIR
FILE_NAME="$TEMP_DIR""spotify.zip"

echo "downloading spotify installer file to $FILE_NAME"
URL="https://download.scdn.co/SpotifyInstaller.zip"
curl -o $FILE_NAME $URL

unzip $FILE_NAME -d $TEMP_DIR

echo "searching for app in $TEMP_DIR"
IFS=$'\n'
POS_APPS=($(find "$TEMP_DIR" -name '*.app'))
APP=""
for POS_APP in ${POS_APPS[@]}; do 
  APP="$( echo "$POS_APP" | grep -v "contents")" #check to make sure it is the main app
  if [[ "$APP" != "" ]]; then
    break
  fi 
done 
APP_NAME=$(basename "$APP")

echo "running spotify installer"
open --wait-apps $APP

rm -rf temp/

