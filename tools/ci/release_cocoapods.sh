#!/bin/bash

set -euxo pipefail

echo "+++ Pushing podspecs to CocoaPods"

function publish_podspec() {
  local -r pod_name="$1"

  echo -e "\n++ Pushing '$pod_name' podspec to CocoaPods\n"
  pod trunk push "$pod_name.podspec" --verbose
}

publish_podspec "BitdriftCapture"

# Sleep for 1 minute to allow the CocoaPods specs repository to update. The CocoaPods repository is
# behind a DNS system that uses caching, which prevents us from seeing the BitdriftCapture update immediately
# after it happens."
VERSION=$(cat BitdriftCapture.podspec | grep "s.version = '" | sed "s/.*s.version = '\(.*\)'/\1/")

# Execute the curl command to see if the latest pod is available in https://cdn.cocoapods.org/all_pods_versions_0_7_9.txt
# in a loop until the version is there. The loop exits if the pod is there but also if 30 minutes has passed.
START_TIME=$(date +%s)
until { curl -s "https://cdn.cocoapods.org/all_pods_versions_0_7_9.txt" | gunzip | grep -q "BitdriftCapture.*/$VERSION/"; }; do
  SECONDS=$(($(date +%s) - $START_TIME))
  if [ $SECONDS -gt 1800 ]; then
    echo "Timed out waiting for BitdriftCapture $VERSION to be available in the CocoaPods specs repository."
    exit 1
  fi

  echo "BitdriftCapture $VERSION not available in the CocoaPods specs repository yet. Sleeping for 10 seconds."
  sleep 60
done


# Make sure that the CocoaPods specs repo is up-to-date.
# Important, as we push specs sequentially, and one podspec might depend on another.
pod cache clean --all
pod repo update --verbose

publish_podspec "CaptureSwiftyBeaver"
publish_podspec "CaptureCocoaLumberjack"
