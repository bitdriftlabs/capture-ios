// swift-tools-version:6.0.0
import PackageDescription

let package = Package(
    name: "Capture",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Capture",
            targets: ["Capture"]
        ),
        .library(
            name: "CaptureCocoaLumberjack",
            targets: ["CaptureCocoaLumberjack"]
        ),
        .library(
            name: "CaptureSwiftyBeaver",
            targets: ["CaptureSwiftyBeaver"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git",
            .upToNextMajor(from: "3.8.0")
        ),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", .upToNextMajor(from: "2.1.0")),
    ],
    targets: [
        .binaryTarget(
            name: "Capture",
            url: "https://dl.bitdrift.io/sdk/ios/capture-0.18.3/Capture.zip",
            checksum: "8af5757b9aa86567390700ebc965ed3a1a061a74fa2bd73965222bc0213ea188"
        ),
        .target(
            name: "CaptureCocoaLumberjack",
            dependencies: [
                "Capture",
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack"),
            ]
        ),
        .target(
            name: "CaptureSwiftyBeaver",
            dependencies: [
                "Capture",
                .product(name: "SwiftyBeaver", package: "SwiftyBeaver"),
            ]
        ),
        .target(
            name: "CaptureMocks",
            dependencies: ["Capture"]
        ),
        .testTarget(
            name: "CaptureTests",
            dependencies: ["Capture"],
            path: "Tests/Capture"
        ),
        .testTarget(
            name: "CaptureSwiftyBeaverTests",
            dependencies: ["CaptureSwiftyBeaver", "CaptureMocks"],
            path: "Tests/CaptureSwiftyBeaver"
        ),
        .testTarget(
            name: "CaptureCocoaLumberjackTests",
            dependencies: ["CaptureCocoaLumberjack", "CaptureMocks"],
            path: "Tests/CaptureCocoaLumberjack"
        ),
    ]
)
