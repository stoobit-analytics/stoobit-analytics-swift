//
//  WishlistManager.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 11.06.25.
//

import Foundation

@Observable final class WishlistManager {
    var filter: Filter = .suggestions
    var wishes: [Wish] = [
        Wish(
            title: "Language Support",
            description: "Please add support for more languages, like German, French & Italian.",
            upvotes: 51
        ),
        Wish(
            title: "Dark Mode",
            description: "Please add a dark mode to stoobit analytics.",
            upvotes: 122
        )
    ]
    
    func loadWishes() async { }
}
