# stoobit analytics SDK Swift
### Installing the Library
You can install the Swift library by using Swift Package Manager.
1. In Xcode, select File > Add Packages…
2. Enter the Package URL below and select version `v1.0.0` or above.
```
https://github.com/stoobit-analytics/stoobit-analytics-swift
```
After installing the library, import `Analytics` into your app file (e.g. `MyApp.swift`) and initialize **stoobit analytics** within the `struct`'s initializer.
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

```swift

```

### Sending Events

### Flushing Events
