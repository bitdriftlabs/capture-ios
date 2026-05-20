#!/bin/bash

set -euxo pipefail

# https://github.com/actions/runner-images/blob/main/images/macos/macos-26-Readme.md#xcode
sudo xcode-select --switch /Applications/Xcode_26.0.1.app
