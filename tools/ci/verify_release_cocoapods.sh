#!/bin/bash

# fail job on shell command or pipe failure
#
# -e exit immediately on pipeline failure
# -u treat unset variables or params as an error
# -x print trace of commands
# -o set option
# pipefail: pipeline return value is first nonzero value
set -euxo pipefail

# Pod sub-section is dependent on name hash
POD_NAME="$1"
POD_HASH=$(printf "$POD_NAME" | md5sum | head -c 3)
CDN_SECTION=$(ruby -e "print '$POD_HASH'.split('').join('_')")

# Pod list subset containing BitdriftCapture
CDN_PATH="https://cdn.cocoapods.org/all_pods_versions_$CDN_SECTION.txt"

# Current release version number
VERSION=$(cat $POD_NAME.podspec | grep "s.version = '" | sed "s/.*s.version = '\(.*\)'/\1/")

# Check if the latest version is present
curl --silent "$CDN_PATH" | grep --quiet "$POD_NAME.*/$VERSION/"
