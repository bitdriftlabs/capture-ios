#!/bin/bash

set -euxo pipefail

# https://github.com/actions/runner-images/blob/main/images/macos/macos-13-Readme.md#xcode
sudo xcode-select --switch /Applications/Xcode_15.2.app