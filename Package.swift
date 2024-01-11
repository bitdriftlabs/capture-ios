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
           url: "https://dl.bitdrift.io/sdk/ios/capture-0.9.97/Capture.zip",
           checksum: "b02f4efd43e3bfd9255b599d36159fa275a179aa6ad6952154ff40862b119780"
       ),
        .testTarget(
            name: "CaptureUnit",
            dependencies: ["Capture"]
        ),
    ]
)
