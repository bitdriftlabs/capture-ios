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
sleep 1800

# Make sure that the CocoaPods specs repo is up-to-date.
# Important, as we push specs sequentially, and one podspec might depend on another.
pod cache clean --all
pod repo update --verbose

publish_podspec "CaptureSwiftyBeaver"

# Use Xcode 14.3.1 as Xcode 15 doesn't support iOS 11 and this is a minimal deployment target supported by Cocoalumberjack.
# See https://github.com/CocoaPods/CocoaPods/issues/11839 for more details.
# TODO(Augustyniak): Move to Xcode 15 once https://github.com/CocoaLumberjack/CocoaLumberjack/issues/1404 is resolved.
sudo xcode-select --switch /Applications/Xcode_14.3.1.app
publish_podspec "CaptureCocoaLumberjack"
