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
           url: "https://dl.bitdrift.io/sdk/ios/capture-0.9.113/Capture.zip",
           checksum: "7963836601475bd9bd8b70a45465211fbbafe808d193c2e25284e23a83783fae"
       ),
        .testTarget(
            name: "CaptureTests",
            dependencies: ["Capture"]
        ),
    ]
)
