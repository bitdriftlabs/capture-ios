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

fake_git_remote_dir="$(mktemp -d)"
readonly fake_git_remote_dir="$fake_git_remote_dir"

# Create a Git repository that will serve as a mock 'remote' for the local-podspecs Git repository.
pushd "$fake_git_remote_dir"
    git init --bare
popd

# Create a Git repository for local-podspecs.
pushd "$local_podspecs_dir"
    git init
    git remote add origin "$fake_git_remote_dir"

    git config receive.denyCurrentBranch warn

    git commit --allow-empty -m "Initial commit"
    git push origin main
popd

# Add the local-podspecs repository to CocoaPods.
pod repo add local-podspecs "$local_podspecs_dir"

podspecs=(\
  "BitdriftCapture" \
  "CaptureCocoaLumberjack" \
  "CaptureSwiftyBeaver" \
)

for podspec in "${podspecs[@]}"; do
  publish_podspec "$podspec"
done
