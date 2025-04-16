//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Foundation

extension AnalyticsActor {
    func flush() async {
        do {
            if self.events.isEmpty == false {
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                
                request.setValue(
                    self.key, forHTTPHeaderField: "Authorization"
                )
                request.setValue(
                    "application/json", forHTTPHeaderField: "Content-Type"
                )
                
                let encoder = JSONEncoder()
                encoder.dateEncodingStrategy = .iso8601
                request.httpBody = try encoder.encode(self.events)
                
                let (_, response) = try await URLSession
                    .shared.data(for: request)
                
                if let httpResponse = response as? HTTPURLResponse,
                   httpResponse.statusCode != 200
                {
                    throw AnalyticsError.flushFailed
                }
                
                self.events.removeAll()
                
                #if DEBUG
                dump(
                    "🟢 Sending data to stoobit analytics was successful.",
                    name: "stoobit analytics"
                )
                #endif
            } else {
                #if DEBUG
                dump(
                    "🟡 Nothing to flush.",
                    name: "stoobit analytics"
                )
                #endif
            }
        } catch {
            #if DEBUG
            dump(
                "🔴 Sending data to stoobit analytics failed.",
                name: "stoobit analytics"
            )
            #endif
        }
    }
}
