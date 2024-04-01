#!/bin/bash

set -euxo pipefail

mkdir -p bin/

# Swift code formatting & linting.
curl -OL https://github.com/realm/SwiftLint/releases/download/0.54.0/swiftlint_linux.zip
unzip swiftlint_linux.zip
mv swiftlint bin/
chmod +x bin/swiftlint

# The binaries above dynamically link a library provided by Swift, so download Swift + update the
# LD_LIBRARY_PATH tell the system how to find them.
swift_archive_name="swift-5.9.2-RELEASE-ubuntu22.04"
curl -OL "https://download.swift.org/swift-5.9.2-release/ubuntu2204/swift-5.9.2-RELEASE/$swift_archive_name.tar.gz"
tar xf "$swift_archive_name.tar.gz"

echo "PATH=$(pwd):$(pwd)/$swift_archive_name/usr/bin:$PATH" >> "$GITHUB_ENV"
echo "LD_LIBRARY_PATH=$(pwd)/$swift_archive_name/usr/lib" >> "@GITHUB_ENV"
