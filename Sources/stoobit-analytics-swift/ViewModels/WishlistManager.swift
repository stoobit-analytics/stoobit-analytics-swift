//
//  WishlistManager.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 11.06.25.
//

import Foundation

@Observable final class WishlistManager {
    var wishes: [Wish] = []
    
    func loadWishes() async { }
}
