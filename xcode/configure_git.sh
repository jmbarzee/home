#!/bin/sh

set -e
set -u


NAME="Jacob Barzee"
echo "configuring git user.name to" $NAME
git config --global user.name $NAME

EMAIL="jmbarzee@gmail.com"
echo "configuring git user.email to" $EMAIL
git config --global user.email $EMAIL