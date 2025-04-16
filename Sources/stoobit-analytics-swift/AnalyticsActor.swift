//
//  stoobit_analytics_swift.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 27.03.25.
//

import Foundation

actor AnalyticsActor {
    // Shared Instance
    public static let shared = AnalyticsActor()
    
    // Analytics Properties
    let url = URL(string: "http://localhost:3456/track")!
    
    internal var key: String = ""
    internal var events: [Event] = []
    
    // Initialization
    func initialize(with key: Key, interval: TimeInterval) {
        self.key = key
        
        Timer
            .scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                Task { await self.flush() }
            }
    }
}

