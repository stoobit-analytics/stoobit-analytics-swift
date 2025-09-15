//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 15.09.25.
//

import Foundation

struct NotificationRegistration: Codable {
    var userID: String
    
    var token: String
    var language: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userid"
        case token, language
    }
}
