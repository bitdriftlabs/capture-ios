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
           url: "https://dl.bitdrift.io/sdk/ios/capture-0.9.106/Capture.zip",
           checksum: "f82fc5731b1c910e66c4967b99553e7d0b7fea5639aa40c6ba76fd6de13cb03e"
       ),
        .testTarget(
            name: "CaptureUnit",
            dependencies: ["Capture"]
        ),
    ]
)
