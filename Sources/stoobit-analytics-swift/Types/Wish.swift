//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 08.06.25.
//

import Foundation

struct Wish: Codable, Identifiable, Hashable {
    var id: UUID
    
    init(title: String, description: String, upvotes: Int) {
        self.id = UUID()
        self.timestamp = Date()
        
        self.title = title
        self.upvotes = upvotes
        self.description = description
    }
    
    var title: String
    var upvotes: Int
    var timestamp: Date
    var description: String
}
