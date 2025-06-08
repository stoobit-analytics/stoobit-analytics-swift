//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Foundation

extension Analytics {
    public func flush() {
        Task {
            do {
                if events.isEmpty == false {
                    var request = URLRequest(url: self.url)
                    request.httpMethod = "POST"
                    
                    request.setValue(
                        key, forHTTPHeaderField: "Authorization"
                    )
                    request.setValue(
                        "application/json", forHTTPHeaderField: "Content-Type"
                    )
                    
                    let encoder = JSONEncoder()
                    encoder.dateEncodingStrategy = .iso8601
                    request.httpBody = try encoder.encode(events)
                    
                    let (_, response) = try await URLSession
                        .shared.data(for: request)
                    
                    if let httpResponse = response as? HTTPURLResponse,
                       httpResponse.statusCode != 200
                    {
                        throw AnalyticsError.flushFailed
                    }
                    
                    self.events.removeAll()
                    self.store()
                    
                    if isDebuggerEnabled {
                        Log
                            .info("Events flushed successfully.")
                    }
                }
            } catch {
                if isDebuggerEnabled {
                    Log
                        .error("Sending events failed with error: \(error)")
                }
            }
        }
    }
}
