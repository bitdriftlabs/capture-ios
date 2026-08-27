#!/bin/bash

set -euxo pipefail

readonly version="$1"
readonly base_url="https://dl.bitdrift.io/sdk/ios"

function update_manifest() {
  local -r manifest="$1"

  local artifact
  artifact="$(sed -n "s#.*$base_url/capture-[^/]*/\([^\"]*\.zip\)\".*#\1#p" "$manifest" | head -1)"

  if [[ -z "$artifact" ]]; then
    echo "could not find a Capture artifact URL in $manifest" >&2
    exit 1
  fi

  local checksum
  checksum="$(curl -fsS "$base_url/capture-$version/$artifact.sha256")"

  sed -e "s#\($base_url/capture-\)[^/]*\(/\)#\1$version\2#g" \
    -e "s#\(checksum: \"\)[^\"]*\(\"\)#\1$checksum\2#g" \
    "$manifest" > "$manifest.tmp"
  mv "$manifest.tmp" "$manifest"

  echo "+ Updated $manifest to $artifact $version"
}

update_manifest "Package.swift"
update_manifest "Package@swift-6.0.swift"
