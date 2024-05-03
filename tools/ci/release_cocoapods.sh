#!/bin/bash

set -euxo pipefail

echo "+++ Pushing podspecs to CocoaPods"

function publish_podspec() {
  local -r pod_name="$1"

  echo -e "\n++ Pushing '$pod_name' podspec to CocoaPods\n"
  pod trunk push "$pod_name.podspec" --verbose
}

publish_podspec "BitdriftCapture"

# Sleep for 30 minutes to allow the CocoaPods specs repository to update. The CocoaPods repository is 
# behind a DNS system that uses caching, which prevents us from seeing the BitdriftCapture update immediately
# after it happens."
sleep 30 * 60

# Make sure that the CocoaPods specs repo is up-to-date.
# Important, as we push specs sequentially, and one podspec might depend on another.
pod cache clean --all
pod repo update --verbose

podspecs=(\
  "CaptureCocoaLumberjack" \
  "CaptureSwiftyBeaver" \
)

for podspec in "${podspecs[@]}"; do
  publish_podspec "$podspec"
done
