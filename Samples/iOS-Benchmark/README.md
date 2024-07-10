# iOS Benchmark App

> [!IMPORTANT]
> A bitdrift Capture API key is needed to perform meaningful performance measurements. Contact info@bitdrift.io to get an API Key.

## Table of Contents
1. [Setup](#setup)
2. [Performance Measurements](#performance-measurements)
    1. [Time Benchmarks](#time-benchmarks)
    2. [Memory Profiling](#memory-profiling)

## Setup

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

## Performance Measurements

### Time Benchmarks

1. Open `iOS-Benchmark.xcodeproj` project in Xcode.
1. Run the app (`⌘` + `r`).
1. Tap the "Run benchmark!" button.
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-setup-05.png" height="300">
    </p>
1. The benchmark results should appear in the Xcode console. An example can be found below.

#### Example Results

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

### Memory Profiling

1. Open `iOS-Benchmark.xcodeproj` project in Xcode.
1. Launch Xcode profiler (`⌘` + `i`).
1. Select the "Allocations" profiling template and click "Choose".
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-memory-01.png" height="300">
    </p>
1. Click record button. This should launch the iOS Benchmark App in the selected simulator/real device.
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-memory-02.png" height="300">
    </p>
1. Click "Mark generation" in Xcode Instruments to capture a baseline for memory usage measurements.
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-memory-03.png" height="300">
    </p>
1. Go to the launched "iOS Benchmark App", tap "Run benchmark!" button. Wait for the benchmark to complete.
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-memory-04.png" height="300">
    </p>
1. Go back to Xcode Instruments.
1. Click "Mark Generation".
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-memory-05.png" height="300">
    </p>
1. There should be "Generation A" and "Generation B" generations displayed in the UI.
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-memory-06.png" height="300">
    </p>
1. The value in the 'Growth' column of the 'Generation B' row is a good approximation of the amount of memory the SDK consumes.
This value may be lower in the case of real apps, as they may already load some of the objects used by the SDK into memory.
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-memory-07.png" height="300">
    </p>
1. Expand "Generation B" to see what the SDK uses the memory for. The symbols should be there.
    <p align="center">
    <img src="/Resources/Assets/ios-benchmark-app-memory-08.png" height="300">
    </p>
