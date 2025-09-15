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
    
    @State var manager = WishlistManager()
    @State var selectedWish: Wish?
    
    @Namespace var namespace
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(manager.wishes) { wish in
                        Button(action: { selectedWish = wish }) {
                            ListItem(wish: wish)
                        }
                    }
                } header: {
                    if !manager.wishes.isEmpty {
                        Text(manager.filter.rawValue)
                            .contentTransition(.interpolate)
                    }
                }
            }
            .refreshable { await manager.loadWishes() }
            .task { await manager.loadWishes() }
            .scrollDisabled(manager.wishes.isEmpty)
            .navigationTitle("Wishlist")
            .toolbar {
                WishlistToolbarView(isPresented: $isPresented)
            }
            .sheet(item: $selectedWish) { wish in
                WishView(wish: wish)
                    .presentationDetents([.medium])
            }
        }
        .environment(manager)
        .overlay {
            if manager.wishes.isEmpty {
                WishlistEmptyView()
            }
        }
    }
    
    @ViewBuilder func ListItem(wish: Wish) -> some View {
        HStack {
            Image(systemName: manager.filter.symbol)
                .font(.title3)
                .contentTransition(.symbolEffect)
                .foregroundStyle(Color.accentColor)
                .frame(width: 35)
            
            VStack(alignment: .leading) {
                Text(wish.title)
                    .foregroundStyle(Color.primary)
                    .lineLimit(1)
                    .font(.headline)
                
                Text(wish.timestamp, format: .dateTime)
                    .foregroundStyle(Color.secondary)
                    .font(.caption)
            }
            
            Spacer()
            
            VStack(alignment: .center, spacing: 5) {
                Image(systemName: "heart.fill")
                    .imageScale(.small)
                
                Text("\(wish.upvotes)")
                    .font(.caption)
            }
            .foregroundStyle(Color.red)
            .padding(.horizontal, 5)
        }
    }
}

#Preview {
    @Previewable
    @State var isPresented = true
    
    Button("Present") {
        isPresented.toggle()
    }
    .wishlist(
        isPresented: $isPresented,
        analytics: Analytics(key: ""),
        type: .sheet
    )
}
