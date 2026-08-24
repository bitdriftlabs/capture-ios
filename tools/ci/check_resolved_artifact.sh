#!/bin/bash

set -euo pipefail

readonly expected="$1"

resolved="$(xcrun swift package dump-package |
  grep -o 'https://dl\.bitdrift\.io/sdk/ios/capture-[^"]*' | head -1)"
readonly resolved

swift_version="$(xcrun swift --version 2>/dev/null |
  sed -n 's/.*Apple Swift version \([0-9.]*\).*/\1/p' | head -1)"
readonly swift_version

if [[ -z "$resolved" ]]; then
  echo "no Capture artifact URL found in the resolved manifest" >&2
  exit 1
fi

if [[ "$resolved" != */"$expected" ]]; then
  echo "Swift $swift_version resolved $resolved, expected the manifest pointing at $expected" >&2
  exit 1
fi

echo "+ Swift $swift_version resolved $resolved"
