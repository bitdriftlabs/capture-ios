// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Capture",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Capture",
            targets: ["Capture"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "Capture",
            url: "https://dl.bitdrift.io/sdk/ios/capture-0.9.112/Capture.zip",
            checksum: "2bcc60ea9e22679b74cb0ef566117e3949e085cd7346ce2639245dcc720fd982"
        ),
        .testTarget(
            name: "CaptureTests",
            dependencies: ["Capture"]
        ),
    ]
)
