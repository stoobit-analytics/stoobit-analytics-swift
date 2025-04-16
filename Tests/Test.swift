//
//  Test.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Testing
import Foundation
@testable import Analytics

struct Test {
    @Test func test() async throws {
        guard let url = URL(string: "http://localhost:3456/track") else {
            return
        }
         
        // Setup Request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Set Values
        request.setValue(
            "sk_live_ABCD1234EFGH5678", forHTTPHeaderField: "Authorization"
        )
        request.setValue(
            "application/json", forHTTPHeaderField: "Content-Type"
        )
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
//        request.httpBody = try encoder.encode([event])
        
        // Start Request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            print("Status code:", httpResponse.statusCode)
        }
        
        let responseString = String(
            data: data, encoding: .utf8
        ) ?? "Invalid response"
        
        print("Response:", responseString)
                
    }
}
