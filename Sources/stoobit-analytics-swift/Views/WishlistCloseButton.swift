//
//  SwiftUIView.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 08.06.25.
//

import SwiftUI

struct CloseButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
           Text("Close")
        }
    }
}
