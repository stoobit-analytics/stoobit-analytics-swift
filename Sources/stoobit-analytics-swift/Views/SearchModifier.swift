//
//  SearchModifier.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 11.06.25.
//

import SwiftUI

struct SearchModifier: ViewModifier {
    var hidden: Bool
    @Binding var text: String
    
    func body(content: Content) -> some View {
        if hidden {
            content
        } else {
            content
                .searchable(text: $text)
        }
    }
}
