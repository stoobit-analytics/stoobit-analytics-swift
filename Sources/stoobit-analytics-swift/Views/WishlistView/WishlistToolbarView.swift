//
//  WishlistToolbarView.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 11.06.25.
//

import SwiftUI

struct WishlistToolbarView: ToolbarContent {
    @Binding var isPresented: Bool
    @Environment(WishlistManager.self) var manager
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button("Close") {
                isPresented.toggle()
            }
        }
        
        ToolbarItem(placement: .primaryAction) {
            @Bindable var manager = manager
            
            Menu("Filter",systemImage: "line.3.horizontal.decrease") {
                Picker("Wishes", selection: $manager.filter.animation()) {
                    Text(Filter.suggestions.rawValue)
                        .tag(Filter.suggestions)
                }
                Divider()
                Picker("Wishes", selection: $manager.filter.animation()) {
                    Text(Filter.pending.rawValue)
                        .tag(Filter.pending)
                    
                    Text(Filter.added.rawValue)
                        .tag(Filter.added)
                }
            }
            .tint(
                manager.filter == .suggestions ? Color.primary : Color.accentColor
            )
        }
        
        
        if #available(iOS 26.0, *) {
            ToolbarSpacer(.fixed, placement: .primaryAction)
        }
        
        ToolbarItem(placement: .primaryAction) {
            Button("Add", systemImage: "plus") {
                
            }
            .tint(Color.accentColor)
        }
    }
}
