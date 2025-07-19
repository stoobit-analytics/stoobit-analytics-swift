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
            title: "Support for German",
            description: "Please add support for other languages, like German. Please add support for other languages, like German. Please add support for other languages, like German. Please add support for other languages, like German. Please add support for other languages, like German. Please add support for other languages, like German. Please add support for other languages, like German. Please add support for other languages, like German. "
        )
    ]
    
    func loadWishes() async { }
}
