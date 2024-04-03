// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Capture",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Capture",
            targets: ["CaptureTarget"]
        ),
        .library(
            name: "CaptureCocoaLumberjack",
            targets: ["CaptureCocoaLumberjack"]
        ),
        .library(
            name: "CaptureSwiftyBeaverIntegration",
            targets: ["CaptureSwiftyBeaverIntegration"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "2.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "CaptureTarget",
            url: "https://dl.bitdrift.io/sdk/ios/capture-0.9.113/Capture.zip",
            checksum: "2bcc60ea9e22679b74cb0ef566117e3949e085cd7346ce2639245dcc720fd982"
        ),
        .target(
            name: "CaptureCocoaLumberjack",
            dependencies: [
                "CaptureTarget",
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack"),
            ]
        ),
        .target(
            name: "CaptureSwiftyBeaver",
            dependencies: [
                "CaptureTarget",
                .product(name: "SwiftyBeaver", package: "SwiftyBeaver"),
            ]
        ),
        .testTarget(
            name: "CaptureTests",
            dependencies: ["CaptureTarget"]
        ),
    ]
)
