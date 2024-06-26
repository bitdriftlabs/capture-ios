# iOS Benchmark App

# Setup

1. Open the `iOS-Benchmark.xcodeproj` project in Xcode.
1. Go to project settings > "Signing & Capabilities" and specify your "Team".
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-setup-01.png" height="200">
    </p>
1. Go to the `ContentView.swift` file and set `kApiKey` to your bitdrift Capture API Key.
1. Right-click the `Capture` package dependency in the Project Navigator view and select the "Update Package" option to ensure that the latest version of Capture the SDK is used.
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-setup-02.png" height="300">
    </p>
1. Go to the Edit Scheme view (`⌘` + `<`) and make sure that the "Run" scheme uses the "Release" build configuration. 
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-setup-03.png" height="300">
    </p>
1. Go to the Run Destinations view (`⌃` + `Shift` + `0`) and select a real device.
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-setup-04.png" height="300">
    </p>

# Run Benchmark

1. Run the app (`⌘` + `r`).
1. Tap the "Run benchmark!" button.
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-setup-05.png" height="300">
    </p>
1. The benchmark results should appear in the Xcode console. An example can be found below.

## Example Results

The Xcode console benchmark results using an iPhone 15 Pro Max (512GB) and version 0.11.3 of the Capture SDK:

```
name                        time              std        iterations
-------------------------------------------------------------------
Configuration.Configuration   18926375.000 ns ±   0.00 %          1
Logging.log without fields        2000.000 ns ± 120.70 %        512
Logging.PAUSE - IGNORE      1001038000.000 ns ±   0.00 %          1
Logging.log with 5 fields        20792.000 ns ±  36.76 %        512
Logging.PAUSE - IGNORE      1001044583.000 ns ±   0.00 %          1
Logging.log with 10 fields       32895.500 ns ±  35.59 %        512
```
