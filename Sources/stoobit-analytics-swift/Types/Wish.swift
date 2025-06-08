//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 08.06.25.
//

import Foundation

struct Wish: Codable {
    var id: UUID
    
    init(title: String, description: String) {
        self.id = UUID()
        self.timestamp = Date()
        
        self.title = title
        self.description = description
    }
    
    var title: String
    var timestamp: Date
    var description: String
}
