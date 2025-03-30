//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 30.03.25.
//

import Foundation

extension Analytics {
    public typealias Key = String
    public static func initialize(with key: Key) {
        
        
        Analytics.schedule(withInterval: 60)
    }
    
    private static func schedule(withInterval: TimeInterval) {
        Timer.scheduledTimer(
            withTimeInterval: withInterval, repeats: true
        ) { _ in Analytics.flush() }
    }
}
