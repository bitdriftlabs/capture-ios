#!/bin/bash

set -euxo pipefail

echo "++ Pushing Bitf"
pod trunk push BitdriftCapture.podspec --verbose
