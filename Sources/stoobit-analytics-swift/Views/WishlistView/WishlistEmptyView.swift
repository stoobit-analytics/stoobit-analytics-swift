//
//  WishlistEmptyView.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 11.06.25.
//

import SwiftUI

struct WishlistEmptyView: View {
    var body: some View {
        ContentUnavailableView(
            "There aren't any wishes yet.",
            systemImage: "star.slash"
        )
    }
}
