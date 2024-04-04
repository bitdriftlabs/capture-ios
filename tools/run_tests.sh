#!/bin/bash

set -euxo pipefail

xcodebuild \
  -scheme Capture-Package \
  -sdk iphonesimulator17.2 \
  -destination 'platform=iOS Simulator,OS=latest,name=iPhone 15' \
  test
