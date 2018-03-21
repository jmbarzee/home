#!/bin/sh

set -e
set -u

TEMP_DIR="temp/"
mkdir $TEMP_DIR
FILE_NAME="$TEMP_DIR""slack.dmg"

echo "downloading slack image file to $FILE_NAME"
URL="https://downloads.slack-edge.com/mac_releases/Slack-3.1.0.dmg"
curl -o $FILE_NAME $URL

# echo "mounting $FILE_NAME"
PATHS=($(hdiutil attach "$FILE_NAME" 2>&1 | tail -1))
MOUNT_PATH=${PATHS[0]}
DRIVE_PATH="${PATHS[@]:2}"

echo "searching for app in $DRIVE_PATH"
IFS=$'\n'
POS_APPS=($(find "$DRIVE_PATH" ! -path "$DRIVE_PATH" -name '*.app'))
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

hdiutil detach "$MOUNT_PATH" >/dev/null
rm -rf temp/

