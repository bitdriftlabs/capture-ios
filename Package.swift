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
        .library(
            name: "CaptureExtensions",
            targets: ["CaptureExtensions"]
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
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "2.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "Capture",
            url: "https://dl.bitdrift.io/sdk/ios/capture-0.9.115/Capture.zip",
            checksum: "5e7c56b6c38780bf3246d2a7e06d0f7696b918d4c6ecb4b3821a6123063e2ba1"
        ),
        .target(
            name: "CaptureExtensions",
            dependencies: ["Capture", "CaptureShared"]
        ),
        .target(
            name: "CaptureCocoaLumberjack",
            dependencies: [
                "Capture",
                "CaptureShared",
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
        .target(name: "CaptureShared"),
        .testTarget(
            name: "CaptureTests",
            dependencies: ["Capture"],
            path: "Tests/Capture"
        ),
        .testTarget(
            name: "CaptureExtensionsTests",
            dependencies: ["CaptureExtensions"],
            path: "Tests/CaptureExtensions"
        ),
        .testTarget(
            name: "CaptureSwiftyBeaverTests",
            dependencies: ["CaptureSwiftyBeaver"],
            path: "Tests/CaptureSwiftyBeaver"
        ),
        .testTarget(
            name: "CaptureCocoaLumberjackTests",
            dependencies: ["CaptureCocoaLumberjack"],
            path: "Tests/CaptureCocoaLumberjack"
        ),
    ]
)
