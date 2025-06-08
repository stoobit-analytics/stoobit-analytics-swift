//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 08.06.25.
//

import Foundation

extension Analytics {
    internal func store() {
        UserDefaults.standard
            .set(
                Archiver().data(from: self.events),
                forKey: self.defaultskey
            )
    }
}
