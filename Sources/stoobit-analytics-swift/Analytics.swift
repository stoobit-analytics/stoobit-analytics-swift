//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Foundation

public struct Analytics {
    public static func initialize(with key: Key, interval: TimeInterval = 60) {
        Task {
            await AnalyticsActor.shared
                .initialize(with: key, interval: interval)
        }
    }
    
    public static func flush() {
        Task {
            await AnalyticsActor.shared
                .flush()
        }
    }
    
    public static func track(_ event: String, properties: [String: Any] = [:]) {
        Task {
            await AnalyticsActor.shared
                .track(event, properties: properties)
        }
    }
}
