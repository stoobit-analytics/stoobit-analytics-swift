# stoobit analytics SDK Swift
### Installing the Library
You can install the Swift library by using Swift Package Manager.
1. In Xcode, select File > Add Packages…
2. Enter the Package URL below and select version `v1.0.0` or above.
```
https://github.com/stoobit-analytics/stoobit-analytics-swift
```
After installing the library, import Analytics in the application entry point (e.g. MyApp.swift), and initialize stoobit analytics within the App struct’s initializer.
```swift
import Analytics
import SwiftUI

@main
struct MyApp: App {
    init() {
        Analytics.initialize(with: "API Key")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Library Configuration
The **stoobit analytics** library doesn’t send the events you record immediately. Instead, it sends batches every 60 seconds while your application is running. You can customize this time interval within the SDK's initializer.

```swift
Analytics.initialize(with: "API Key", interval: 60)
```

### Sending Events
Use `.track(_ event: String, properties: [String: Any])` to send an event by providing the event name and, optionally, any event properties.
```swift
Analytics.track("Sign In")
```
```swift
Analytics.track("Sign In", properties: ["Plan": "Premium"])
```

### Flushing Events
Call .flush() manually to force-send all unsent events at a particular moment.
```swift
 Analytics.flush()
```
