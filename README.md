# Capture SDK by bitdrift

https://docs.bitdrift.io/ | [Slack](https://communityinviter.com/apps/bitdriftpublic/bitdrifters)

## Integration

See the [official documentation](https://docs.bitdrift.io/sdk/quickstart#ios) to learn more about how to integrate the library in your project.

The following code demonstrates an example setup of Capture SDK in your app:

```swift
import Capture

Logger.configure(
  withAPIKey: "<your-api-key>",
  sessionStrategy: .activityBased()
)
```

### CocoaPods

```Ruby
target 'MyApp' do
  pod 'BitdriftCapture'
end
```

### Swift Package Manager

```swift
.package(url: "https://github.com/bitdriftlabs/capture-ios.git", from: "<version>")
```

## Local Development

Run `make format` to run various formatting tools and linter checks.
