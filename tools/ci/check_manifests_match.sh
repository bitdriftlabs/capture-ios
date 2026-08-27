#!/bin/bash

set -euo pipefail

readonly manifests=("Package.swift" "Package@swift-6.0.swift")

function normalize() {
  sed -e '1d' \
    -e 's#\(url: "https://dl.bitdrift.io/sdk/ios/\).*#\1ARTIFACT",#' \
    -e 's#\(checksum: "\)[^"]*\("\)#\1CHECKSUM\2#' \
    "$1"
}

if diff <(normalize "${manifests[0]}") <(normalize "${manifests[1]}"); then
  echo "+ ${manifests[0]} and ${manifests[1]} declare the same package"
  exit 0
fi

echo "${manifests[0]} and ${manifests[1]} drifted apart, see the diff above" >&2
exit 1
