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
            url: "https://dl.bitdrift.io/sdk/ios/capture-0.17.1/Capture.zip",
            checksum: "eaf04fe9342b9a775ca2d0b72f1ddcc870f2a4d22df0328898b6a8173e4961ee"
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
