#!/bin/bash

set -euxo pipefail

readonly version="$1"
readonly base_url="https://dl.bitdrift.io/sdk/ios"

function update_manifest() {
  local -r manifest="$1"
  local -r artifact="$2"

  local checksum
  checksum="$(curl -fsS "$base_url/capture-$version/$artifact.sha256")"

  sed -e "s#\($base_url/capture-\)[^/]*\(/\)#\1$version\2#g" \
    -e "s#\(checksum: \"\)[^\"]*\(\"\)#\1$checksum\2#g" \
    "$manifest" > "$manifest.tmp"
  mv "$manifest.tmp" "$manifest"

  echo "+ Updated $manifest to $artifact $version"
}

update_manifest "Package.swift" "Capture-swift-6.4.zip"
update_manifest "Package@swift-6.0.swift" "Capture.zip"
