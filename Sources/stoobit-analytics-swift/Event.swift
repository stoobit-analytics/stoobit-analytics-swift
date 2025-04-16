//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Foundation

struct Event: Codable {
    init(name: String, defaultProps: Data, customProps: Data) {
        self.name = name
        self.defaultProps = defaultProps
        self.customProps = customProps
        
        if #available(macOS 12, *) {
            self.time = Date.now
        } else {
            self.time = Date()
        }
    }
    
    let name: String
    let defaultProps: Data
    let customProps: Data
    
    let time: Date
}
