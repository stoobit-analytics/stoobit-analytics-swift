//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Foundation

extension Analytics {
    public func track(_ event: String, properties: [String: Any] = [:]) {
        do {
            let defaultData = try JSONSerialization
                .data(withJSONObject: self.properties(), options: [])
            
            let customData = try JSONSerialization
                .data(withJSONObject: properties, options: [])
            
            let event = Event(
                name: event,
                defaultProps: defaultData,
                customProps: customData
            )
            
            self.events.append(event)
            self.store()
        } catch {
            if isDebuggerEnabled {
                Log.error(
                    "Tracking failed with error: \(error)"
                )
            }
        }
    }
}
