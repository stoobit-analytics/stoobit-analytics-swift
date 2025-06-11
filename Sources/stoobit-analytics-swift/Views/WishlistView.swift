//
//  WishlistView.swift
//  MyApp
//
//  Created by Till Brügmann on 08.06.25.
//

import SwiftUI

struct WishlistView: View {
    @State var manager = WishlistManager()
    
    @Binding var isPresented: Bool
    var analytics: Analytics
    
    @State var filter: Filter = .suggestions
    @State var search: String = ""
    @State var selectedWish: Wish?
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(manager.wishes) { wish in
                        NavigationLink(destination: {
                            WishView(wish: wish)
                        }) {
                           
                        }
                    }
                } header: {
                    if !manager.wishes.isEmpty {
                        Text(filter.rawValue)
                            .contentTransition(.interpolate)
                    }
                }
                
            }
            .refreshable {
                await manager.loadWishes()
            }
            .scrollDisabled(manager.wishes.isEmpty)
            .modifier(SearchModifier(hidden: manager.wishes.isEmpty, text: $search))
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        isPresented.toggle()
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Menu("Filter",systemImage: "line.3.horizontal.decrease") {
                        Picker("Wishes", selection: $filter.animation()) {
                            Text(Filter.suggestions.rawValue)
                                .tag(Filter.suggestions)
                        }
                        Divider()
                        Picker("Wishes", selection: $filter.animation()) {
                            Text(Filter.pending.rawValue)
                                .tag(Filter.pending)
                            
                            Text(Filter.added.rawValue)
                                .tag(Filter.added)
                        }
                    }
                    .tint(
                        filter == .suggestions ? Color.primary : Color.accentColor
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
        .environment(manager)
        .task {
            await manager.loadWishes()
        }
        .overlay {
            WishlistEmptyView()
        }
    }
    
    @ViewBuilder func ListItem(wish: Wish) -> some View {
        HStack {
            Image(systemName: filter.symbol)
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
            .padding(.leading, 5)
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
