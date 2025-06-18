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
            url: "https://dl.bitdrift.io/sdk/ios/capture-0.17.24/Capture.zip",
            checksum: "cae61816320f24ae397d9608f749aa009c60aa6354c53e83bf537b314d0d428d"
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
