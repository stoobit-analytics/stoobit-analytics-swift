# stoobit analytics SDK Swift

### Installing the Library
You can install the Swift library by using Swift Package Manager.
1. In Xcode, select File > Add Packages…
2. Enter the Package URL below and select version `v2.0.0` or above.
```
https://github.com/stoobit-analytics/stoobit-analytics-swift
```
After installing the library, import `Analytics` in the application entry point (e.g. MyApp.swift). Initialize **stoobit analytics** within the App `struct` using your API key, and inject it into SwiftUI's environment to make it available throughout your app.
```swift
import SwiftUI
import Analytics

@main
struct MyApp: App {
    @State var analytics: Analytics = Analytics(key: "API Key")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(analytics)
    }
}
```

### Library Configuration
The **stoobit analytics** library doesn’t send the events you record immediately. Instead, it sends batches every 60 seconds while your application is running. You can customize this time `interval` within the SDK's initializer.
```swift
var analytics: Analytics = Analytics(key: "API Key", interval: 60)
```

To enable debugging messages, initialize **stoobit analytics** with the `debuggingEnabled` flag set to true. This allows you to see detailed logs during development.
```swift
var analytics: Analytics = Analytics(key: "API Key", debuggingEnabled: true)
```

### Sending Events
Use `.track(_ event: String, properties: [String: Any])` to send an event by providing the event name and, optionally, any event properties.
```swift
analytics.track("Sign In")
```
or
```swift
analytics.track("Sign In", properties: ["Plan": "Premium"])
```

### Flushing Events
To manually send all pending events, call `.flush()` at a specific moment — such as when the app is about to close or move to the background.
```swift
 analytics.flush()
```
