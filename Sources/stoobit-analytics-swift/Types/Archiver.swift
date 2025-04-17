//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 17.04.25.
//

import Foundation

struct Archiver {
    func data(from events: [Event]) -> Data {
        return (try? JSONEncoder().encode(events)) ?? Data()
    }
    
    func events(from data: Data) -> [Event] {
        return (try? JSONDecoder().decode([Event].self, from: data)) ?? []
    }
}
