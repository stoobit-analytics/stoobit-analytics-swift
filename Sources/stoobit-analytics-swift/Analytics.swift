//
//  stoobit_analytics_swift.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 27.03.25.
//

import Foundation
import os

@MainActor
open class Analytics {
    // Shared Instance
    public static let shared = Analytics()
    
    // Analytics Properties
    let url = URL(string: "https://analyticsapi.stoobit.com/track")!
    let eventKey = "com.stoobit.eventkey"
    
    internal var key: String = ""
    internal var events: [Event] = []
    
    // Initialization
    public static func initialize(with key: Key, interval: TimeInterval = 60) {
        // Set Key
        Analytics.shared.key = key
        analyticsLogger
            .info("Analytics initialized successfully.")
        
        // Load Unflushed Values
        let defaults = UserDefaults.standard
        let eventKey = Analytics.shared.eventKey
        
        if let stored = defaults.array(forKey: eventKey) as? [Event] {
            Analytics.shared.events = stored
            flush()
        }
        
        // Set Timer
        Timer
            .scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                Task { @MainActor in
                    flush()
                }
            }
    }
    
    internal func store() {
        UserDefaults.standard
            .set(
                Analytics.shared.events,
                forKey: Analytics.shared.eventKey
            )
    }
}

// Logger
internal let analyticsLogger = Logger(
    subsystem: "com.stoobit.analytics", category: "core"
)
