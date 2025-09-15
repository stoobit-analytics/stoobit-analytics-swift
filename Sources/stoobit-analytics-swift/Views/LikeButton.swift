//
//  LikeButton.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 11.06.25.
//

import SwiftUI

struct LikeButton: View {
    @Binding var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        if #available(iOS 26.0, *), #available(macOS 26.0, *) {
            Image(systemName: "heart")
                .foregroundStyle(isSelected ? Color.white : Color.red)
                .symbolVariant(
                    isSelected ? .fill : .none
                )
                .contentTransition(.symbolEffect)
                .frame(width: 50, height: 50)
                .glassEffect(
                    .regular
                        .tint(isSelected ? .red : .clear)
                        .interactive(),
                    in: .circle
                )
                .onTapGesture {
                    if !isSelected {
                        withAnimation {
                            isSelected.toggle()
                        }
                    }
                }
        } else {
            Image(systemName: "heart")
                .foregroundStyle(isSelected ? Color.white : Color.red)
                .symbolVariant(
                    isSelected ? .fill : .none
                )
                .contentTransition(.symbolEffect)
                .frame(width: 50, height: 50)
                .background(isSelected ? Color.red : Color.clear)
                .background(.background)
                .clipShape(.circle)
                .shadow(color: isSelected ? Color.red : Color.secondary, radius: 1)
                .onTapGesture {
                    if !isSelected {
                        withAnimation {
                            isSelected.toggle()
                        }
                    }
                }
        }
    }
}
