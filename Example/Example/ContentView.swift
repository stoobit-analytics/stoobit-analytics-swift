//
//  ContentView.swift
//  Example
//
//  Created by Till Brügmann on 19.07.25.
//

import SwiftUI
import Analytics

struct ContentView: View {
    @State var isPresented = true
    
    var body: some View {
        Button("Present") {
            isPresented.toggle()
        }
        .wishlist(
            isPresented: $isPresented,
            analytics: Analytics(key: ""),
            type: .sheet
        )
    }
}

#Preview {
    ContentView()
}
