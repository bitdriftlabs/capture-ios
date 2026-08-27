#!/bin/bash

set -euxo pipefail

readonly xcode_version="${1:-26.0.1}"
readonly xcode_app="/Applications/Xcode_$xcode_version.app"

# https://github.com/actions/runner-images/blob/main/images/macos/macos-26-Readme.md#xcode
if [[ ! -d "$xcode_app" ]]; then
  echo "$xcode_app is not installed on this machine. Available Xcode versions:" >&2
  ls -d /Applications/Xcode*.app >&2
  exit 1
fi

sudo xcode-select --switch "$xcode_app"
