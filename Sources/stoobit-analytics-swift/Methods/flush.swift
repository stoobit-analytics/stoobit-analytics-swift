//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Foundation

extension Analytics {
    public static func flush() {
        Task {
            do {
                if Analytics.shared.events.isEmpty == false {
                    var request = URLRequest(url: Analytics.shared.url)
                    request.httpMethod = "POST"
                    
                    request.setValue(
                        Analytics.shared.key,
                        forHTTPHeaderField: "Authorization"
                    )
                    request.setValue(
                        "application/json", 
                        forHTTPHeaderField: "Content-Type"
                    )
                    
                    let encoder = JSONEncoder()
                    encoder.dateEncodingStrategy = .iso8601
                    request.httpBody = try encoder.encode(
                        Analytics.shared.events
                    )
                    
                    let (_, response) = try await URLSession
                        .shared.data(for: request)
                    
                    if let httpResponse = response as? HTTPURLResponse,
                       httpResponse.statusCode != 200
                    {
                        throw AnalyticsError.flushFailed
                    }
                    
                    Analytics.shared.events.removeAll()
                    Analytics.shared.store()
                    
                    analyticsLogger
                        .info("Analytics flushed successfully.")
                }
            } catch {
                analyticsLogger
                    .error("Sending data to stoobit analytics failed.")
            }
        }
    }
}
