//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Foundation

extension AnalyticsActor {
    func track(_ event: String, properties: [String: Any]) {
        do {
            let defaultData = try JSONSerialization.data(
                withJSONObject: [], options: [] // TODO
            )
            
            let customData = try JSONSerialization.data(
                withJSONObject: properties, options: []
            )
            
            let event = Event(
                name: event,
                defaultProps: defaultData,
                customProps: customData
            )
            
            self.events.append(event)
        } catch {
#if DEBUG
            dump(
                "Converting provided properties to JSON failed.",
                name: "stoobit analytics"
            )
#endif
        }
    }
}
