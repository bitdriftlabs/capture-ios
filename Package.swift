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
           url: "https://dl.bitdrift.io/sdk/ios/capture-0.9.108/Capture.zip",
           checksum: "67bb7b82ed106299fa5854901007e244782e1fd6cbdea6a88001e28781da656d"
       ),
        .testTarget(
            name: "CaptureUnit",
            dependencies: ["Capture"]
        ),
    ]
)
