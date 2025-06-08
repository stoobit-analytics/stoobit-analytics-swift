//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 24.04.25.
//

import Foundation

extension Analytics {
    internal func loadID() {
        let defaults = UserDefaults.standard
        if let stored = defaults.string(forKey: "com.stoobit.id") {
            self.userID = stored
        } else {
            self.userID = UUID().uuidString
            defaults.set(self.userID, forKey: "com.stoobit.id")
        }
    }
    
    func loadEvents() {
        let defaults = UserDefaults.standard
        if let stored = defaults.data(forKey: defaultskey) {
            events = Archiver().events(from: stored)
        }
    }
}
