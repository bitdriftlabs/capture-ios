#!/bin/bash

set -euxo pipefail

echo "+++ Verify CocoaPods podspecs"

function publish_podspec() {
  local -r pod_name="$1"

  echo -e "\n++ Pushing '$pod_name' podspec to local-podpsecs CocoaPods repo\n"
  pod repo push local-podspecs --verbose "$pod_name.podspec"
}

echo "+++ Adding local-podpsecs CocoaPods repo"

local_podspecs_dir="$(mktemp -d)"
readonly local_podspecs_dir="$local_podspecs_dir"

pod repo add local-podspecs "$local_podspecs_dir"

podspecs=(\
  "BitdriftCapture" \
  "CaptureCocoaLumberjack" \
  "CaptureSwiftyBeaver" \
)

for podspec in "${podspecs[@]}"; do
  publish_podspec "$podspec"
done
