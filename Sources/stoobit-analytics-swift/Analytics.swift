//
//  stoobit_analytics_swift.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 27.03.25.
//

import Foundation

open class Analytics {
    // Shared Instance
    public static let instance = Analytics()
    
    // Values
    private var key: String = ""
    private var events: [Event] = []
    
    // Methods
    public typealias Key = String
    
    // Methods
    public static func initialize(with key: Key) {
        self.instance.key = key
        Analytics.schedule(interval: 60)
    }
    
    private static func schedule(interval: TimeInterval) {
        Timer
            .scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                if self.instance.events.isEmpty == false {
                    Task {
                        do {
                            try await Analytics.flush()
                            self.instance.events.removeAll()
                            
                            print("🟢 Flush Successful")
                        } catch {
                            print("🔴 Flush Failed")
                        }
                    }
                } else {
                    print("🟡 Nothing to Flush")
                }
            }
    }
    
    public static func flush() async throws {
        guard let url = URL(string: "http://localhost:3456/track") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue(self.instance.key, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        request.httpBody = try encoder.encode(self.instance.events)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode != 200
        {
            throw AnalyticsError.flushFailed
        }
    }
    
    public static func track(_ event: String, properties: [String: Any]) {
        do {
            let customData = try JSONSerialization.data(
                withJSONObject: properties, options: []
            )
            
            let event = Event(
                name: event,
                defaultProps: Data(),
                customProps: customData
            )
            
            self.instance.events.append(event)
        } catch {
            print("")
        }
    }
}

