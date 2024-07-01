# iOS Benchmark App

# Set up

1. Open the `iOS-Benchmark.xcodeproj` project in Xcode.
1. Go to project settings > "Signing & Capabilities" and specify your "Team".
![plot](/Resources/Assets/ios-benchmark-app-setup-01.png)
1. Go to the `ContentView.swift` file and set `kApiKey` to your bitdrift Capture API Key.
1. Right-click the `Capture` package dependency in the Project Navigator view and select the "Update Package" option to ensure that the latest version of Capture the SDK is used.
![plot](/Resources/Assets/ios-benchmark-app-setup-02.png)
1. Go to the Edit Scheme view (`⌘` + `<`) and make sure that the "Run" scheme uses the "Release" build configuration.
![plot](/Resources/Assets/ios-benchmark-app-setup-03.png)
1. Go to the Run Destinations view (`⌃` + `Shift` + `0`) and select a real device.
![plot](/Resources/Assets/ios-benchmark-app-setup-04.png)

# Run

1. Run the app (`⌘` + `r`).
2. Tap the "Run benchmark!" button.
![plot](/Resources/Assets/ios-benchmark-app-setup-05.png)
3. The benchmark results should appear in the Xcode console. An example can be found below.

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
