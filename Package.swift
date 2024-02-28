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
           url: "https://dl.bitdrift.io/sdk/ios/capture-0.9.110/Capture.zip",
           checksum: "d966dd84bd6e1eef3d2c0f5cd8bc1619b338c626aed205cd218757f1c5a8ee25"
       ),
        .testTarget(
            name: "CaptureUnit",
            dependencies: ["Capture"]
        ),
    ]
)
