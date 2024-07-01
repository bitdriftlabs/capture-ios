# iOS Benchmark App

# Set up

1. Launch `iOS-Benchmark.xcodeproj`.
1. Go to project settings > "Signing & Capabilities" and specify your "Team".
![plot](/Resources/Assets/ios-benchmark-app-setup-01.png)
1. Go to `ContentView.swift` file in the opened Xcode project and set `kApiKey` to your bitdrift Capture API Key.
1. Right click `Capture` Package Dependency in Project Navigator view and select "Update Package" option to make sure that
you are running benchmark using the latest version of the SDK.
![plot](/Resources/Assets/ios-benchmark-app-setup-02.png)
1. Go to Edit Scheme view (`⌘` + `<`) and make sure that "Run" scheme uses "Release" build configuration.
![plot](/Resources/Assets/ios-benchmark-app-setup-03.png)
1. Go to Run Destinations view (`⌃` + `Shift` + `0`) and select a real device.
![plot](/Resources/Assets/ios-benchmark-app-setup-04.png)


# Running

1. Run the app (`⌘` + `r`).
2. Tap "Run benchmark!" button.
![plot](/Resources/Assets/ios-benchmark-app-setup-05.png)
3. The benchmark results should appear in the Xcode console. An example can be find below.

The benchmark results using iPhone 15 Pro Max (512GB) and 0.11.3 version of the Capture SDK:

```
name                        time              std        iterations
-------------------------------------------------------------------
Configuration.Configuration    9543709.000 ns ±   0.00 %          1
Logging.log without fields         291.000 ns ± 272.46 %        512
Logging.PAUSE - IGNORE      1001011667.000 ns ±   0.00 %          1
Logging.log with 5 fields         4375.000 ns ±  25.13 %        512
Logging.PAUSE - IGNORE      1000493541.000 ns ±   0.00 %          1
Logging.log with 10 fields       15062.500 ns ±  67.88 %        512
```
