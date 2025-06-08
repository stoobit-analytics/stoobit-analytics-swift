//
//  SwiftUIView.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 08.06.25.
//

import SwiftUI

struct WishlistViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    
    var analytics: Analytics
    var type: PresentationType
    
    func body(content: Content) -> some View {
#if os(macOS)
        content
            .sheet(isPresented: $isPresented) {
                WishlistView(
                    isPresented: $isPresented, analytics: analytics
                )
            }
#else
        if type == .fullScreenCover {
            content
                .fullScreenCover(isPresented: $isPresented) {
                    WishlistView(
                        isPresented: $isPresented, analytics: analytics
                    )
                }
        } else {
            content
                .sheet(isPresented: $isPresented) {
                    WishlistView(
                        isPresented: $isPresented, analytics: analytics
                    )
                }
        }
#endif
    }
}

public extension View {
    @ViewBuilder func wishlist(
        isPresented: Binding<Bool>,
        analytics: Analytics,
        type: PresentationType = .sheet
    ) -> some View {
        modifier(WishlistViewModifier(
            isPresented: isPresented,
            analytics: analytics,
            type: type
        ))
    }
}
