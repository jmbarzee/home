#!/bin/sh

set -e
set -u

TEMP_DIR="temp/"
mkdir $TEMP_DIR
FILE_NAME="$TEMP_DIR""iterm2.zip"

echo "downloading iterm2 zip file to $FILE_NAME"
URL="https://iterm2.com/downloads/stable/iTerm2-3_1_5.zip"
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

APPS_DIR="/Applications/"
echo "placing slack into $APPS_DIR"
cp -R "$APP" "$APPS_DIR$APP_NAME"

rm -rf temp/

