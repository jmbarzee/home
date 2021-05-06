#!/bin/sh

set -e
set -u

TOOL_NAME="vscode"

TEMP_DIR="temp/"
mkdir $TEMP_DIR
FILE_NAME="$TEMP_DIR""$TOOL_NAME.zip"

echo "downloading $TOOL_NAME zip file to $FILE_NAME"
URL="https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal"
curl -L -o $FILE_NAME $URL

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

APPS_DIR="/Applications/"
echo "placing $APP_NAME into $APPS_DIR"
cp -R "$APP" "$APPS_DIR$APP_NAME"

rm -rf temp/

