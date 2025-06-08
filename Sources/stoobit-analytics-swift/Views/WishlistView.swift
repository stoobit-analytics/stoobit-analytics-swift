//
//  WishlistView.swift
//  MyApp
//
//  Created by Till Brügmann on 08.06.25.
//

import SwiftUI

struct WishlistView: View {
    @Binding var isPresented: Bool
    var analytics: Analytics
    
    @State var wishes: [Wish] = []
    
    var body: some View {
        NavigationStack {
            List {
                
            }
            .refreshable {
                await loadWishes()
            }
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    CloseButton { isPresented.toggle() }
                }
                
#if os(iOS)
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        
                    }
                }
#else
                ToolbarItem(placement: .primaryAction) {
                    Button("Add", systemImage: "plus") {
                        
                    }
                }
#endif
            }
        }
        .task {
            await loadWishes()
        }
    }
    
    func loadWishes() async {
        
    }
}

#Preview {
    @Previewable
    @State var isPresented = true
    
    Text("")
        .sheet(isPresented: $isPresented) {
            WishlistView(
                isPresented: $isPresented,
                analytics: Analytics(key: "")
            )
        }
}
