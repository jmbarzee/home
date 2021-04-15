#!/bin/sh

set -e
set -u

if [[ ! $(xcode-select -v) ]]
  xcode-select --install
fi
