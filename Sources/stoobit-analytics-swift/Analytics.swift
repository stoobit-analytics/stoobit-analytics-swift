//
//  stoobit_analytics_swift.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 27.03.25.
//

import Foundation

@Observable
open class Analytics {
    internal var key: String
    internal var userID: String = ""
    
    internal var events: [Event] = []
    internal let defaultskey = "com.stoobit.eventkey"
    
    internal var interval: Double
    internal var isDebuggerEnabled: Bool = false
    
    internal let url: URL = URL(
        string: "https://analyticsapi.stoobit.com/track"
    )!
    
    public init(
        key: Key,
        interval: TimeInterval = 60,
        debuggingEnabled: Bool = false
    ) {
        self.key = key
        self.interval = interval
        
        loadID()
        loadEvents()
        
        if isDebuggerEnabled {
            Log.info("Analytics initialized successfully.")
        }
        
        flush()
        
        Timer
            .scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                self.flush()
            }
    }
}
