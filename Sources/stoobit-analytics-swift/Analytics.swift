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
    
    internal var key: String = ""
    internal var events: [Event] = []
    
    // Initialization
    public static func initialize(with key: Key, interval: TimeInterval = 60) {
        Analytics.shared.key = key
        analyticsLogger.info("Analytics initialized successfully.")
        
        Timer
            .scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                Task { @MainActor in
                    flush()
                }
            }
    }
}

// Logger
internal let analyticsLogger = Logger(
    subsystem: "com.stoobit.analytics", category: "core"
)
