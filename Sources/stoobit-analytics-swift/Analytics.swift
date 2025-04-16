//
//  stoobit_analytics_swift.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 27.03.25.
//

import Foundation

@MainActor
class Analytics {
    // Shared Instance
    public static let shared = Analytics()
    
    // Analytics Properties
    let url = URL(string: "http://localhost:3456/track")!
    
    internal var key: String = ""
    internal var events: [Event] = []
    
    // Initialization
    static func initialize(with key: Key, interval: TimeInterval = 60) {
        Analytics.shared.key = key
        
        Timer
            .scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                Task { @MainActor in
                    flush()
                }
            }
    }
}

