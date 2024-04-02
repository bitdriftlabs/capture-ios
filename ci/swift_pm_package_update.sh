#!/bin/bash

set -euxo pipefail

readonly version="$1"
readonly checksum="$(curl "https://dl.bitdrift.io/sdk/ios/capture-$VERSION/Capture.zip.sha256")"

# Look for a string in 'Package.swift' that looks like `capture-$VERSION/Capture.zip` and substitute
# existig version for the new one.
sed -e "s#\(capture-\)\(.*\)\(/Capture\.zip\)#\1$version\3#g" Package.swift \
  | sed -e "s#\(checksum: \"\)\(.*\)\(\"\)#\1$checksum\3#g" \
  > Package_tmp.swift
mv Package_tmp.swift Package.swift

echo "Generate Package.swift:"
cat Package.swift
