//
//  WishView.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 11.06.25.
//

import SwiftUI

struct WishView: View {
    var wish: Wish
    @State var isSelected: Bool = false
    
    var body: some View {
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
    }
}
