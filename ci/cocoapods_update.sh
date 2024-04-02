#!/bin/bash

set -euxo pipefail

readonly version="$1"

# Look for a string in 'BitdriftCapture.podspec' that looks like `capture-<VERSION>/Capture.zip` and substitute
# existig version for the new one.
sed -e "s#\(capture-\)\(.*\)\(/Capture\.zip\)#\1$version\3#g" BitdriftCapture.podspec \
  # Look for a "version = '<VERSION>'" string and substitute existig version for the new one.
  | sed -e "s#\(version = \'\)\(.*\)\(\'\)#\1$version\3#g" \
  > BitdriftCapture_tmp.podspec
mv BitdriftCapture_tmp.podspec BitdriftCapture.podspec

echo "Generate BitdriftCapture.podspec:"
cat BitdriftCapture.podspec
