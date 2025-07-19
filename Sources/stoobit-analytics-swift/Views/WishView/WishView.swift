//
//  WishView.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 11.06.25.
//

import SwiftUI

struct WishView: View {
    @Environment(\.dismiss) var dismiss
    
    var wish: Wish
    @State var isSelected: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Voting") {
                    HStack {
                        Text("\(wish.upvotes) Likes")
                            .font(.headline)
                            .foregroundStyle(Color.red)
                        
                        Spacer()
                        
                        LikeButton(isSelected: $isSelected) {
                            isSelected.toggle()
                        }
                    }
                }
                
                Section("Description") {
                    Text(wish.description)
                }
            }
            .navigationTitle(wish.title)
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Close", systemImage: "xmark") {
                        dismiss()
                    }
                }
            }
        }
    }
}
