//
//  Filter.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 11.06.25.
//

import Foundation

enum Filter: String {
    case suggestions = "Wishes"
    case pending = "Coming Soon"
    case added = "Added Features"
    
    var symbol: String {
        switch self {
        case .suggestions:
            return "star"
        case .pending:
            return "hammer"
        case .added:
            return "app.badge.checkmark"
        }
    }
}
