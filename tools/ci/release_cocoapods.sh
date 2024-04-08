#!/bin/bash

set -euxo pipefail

echo "+ Pushing podspecs to CocoaPods"

function publish_podspec() {
  local -r pod_name="$1"

  echo -e "\n++ Pushing '$pod_name' podspec to CocoaPods\n"
  pod trunk push "$pod_name.podspec" --verbose
}

podspecs=(\
  # "BitdriftCapture" \
  "CaptureCocoaLumberjack" \
  "CaptureSwiftyBeaver" \
)

for podspec in "${podspecs[@]}"; do
  # Make sure that the CocoaPods specs repo is up-to-date.
  # Important, as we push specs sequentially, and one podspec might depend on another.
  pod cache clean --all 
  pod repo update --verbose

  publish_podspec "$podspec"
done
