#!/bin/bash

set -euxo pipefail

readonly version="$1"

# Process 'BitdriftCapture.podspec' file:
#  * Look for a `capture-<VERSION>/Capture.zip` string and substitute existig version for the new one.
#  * Look for a `version = '<VERSION>'` string and substitute existig version for the new one.
sed -e "s#\(capture-\)\(.*\)\(/Capture\.zip\)#\1$version\3#g" BitdriftCapture.podspec \
  | sed -e "s#\(version = \'\)\(.*\)\(\'\)#\1$version\3#g" \
  > BitdriftCapture_tmp.podspec
mv BitdriftCapture_tmp.podspec BitdriftCapture.podspec

echo "Generate BitdriftCapture.podspec:"
cat BitdriftCapture.podspec
