// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Capture",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Capture",
            targets: ["Capture"]
        )
    ],
    targets: [
       .binaryTarget(
           name: "Capture",
           url: "https://dl.bitdrift.io/sdk/ios/capture-0.9.99/Capture.zip",
           checksum: "30f490419b8098792f6c37f8b12f619c6a639b1b31dcffa48abe6d8d6c810f76"
       ),
        .testTarget(
            name: "CaptureUnit",
            dependencies: ["Capture"]
        ),
    ]
)
