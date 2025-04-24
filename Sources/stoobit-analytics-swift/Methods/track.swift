//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Foundation

extension Analytics {
    public static func track(_ event: String, properties: [String: Any] = [:]) {
        do {
            let defaultData = try JSONSerialization.data(
                withJSONObject: Analytics.shared.properties(), options: []
            )
            
            let customData = try JSONSerialization.data(
                withJSONObject: properties, options: []
            )
            
            let event = Event(
                name: event,
                defaultProps: defaultData,
                customProps: customData
            )
            
            Analytics.shared.events.append(event)
            Analytics.shared.store()
        } catch {
            analyticsLogger.error(
                "Converting provided properties to JSON failed."
            )
        }
    }
}
