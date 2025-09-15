//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 15.09.25.
//

import Foundation

extension Analytics {
    public func registerForPushNotifications(
        with token: Data, _endpoint: String = Endpoint.pushNotifications.url
    ) {
        Task {
            do {
                guard let url = URL(string: "\(_endpoint)/\(key)") else {
                    return
                }
                
                let token = token.map { String(format: "%02x", $0) }.joined()
                let registration = NotificationRegistration(
                    userID: self.userID, token: token,
                    language: languageID(), bundleIdentifier: bundleID()
                )
                
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue(
                    "application/json", forHTTPHeaderField: "Content-Type"
                )
                
                let encoder = JSONEncoder()
                encoder.dateEncodingStrategy = .iso8601
                request.httpBody = try encoder.encode(registration)
                
                let (_, response) = try await URLSession
                    .shared.data(for: request)
                
                if let httpResponse = response as? HTTPURLResponse,
                   httpResponse.statusCode != 200
                {
                    if isDebuggerEnabled {
                        Log.info("Push notification registration failed with code \(httpResponse.statusCode).")
                    }
                    
                    throw AnalyticsError.notificationRegistrationFailed
                }
                
                if isDebuggerEnabled {
                    Log.info("Push notifications registered successfully.")
                }
            } catch {
                Log.info("Error: \(error)")
            }
        }
    }
    
    public enum Endpoint: String {
        case pushNotifications
        
        public var url: String {
            switch self {
            case .pushNotifications:
                "https://analyticsapi.stoobit.com/push-notifications"
            }
        }
    }
}
