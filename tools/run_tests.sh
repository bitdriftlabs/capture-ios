#!/bin/bash

set -euxo pipefail

xcodebuild \
  -scheme Capture-Package \
  -sdk iphonesimulator26.0 \
  -destination 'platform=iOS Simulator,OS=latest,name=iPhone 17' \
  test
