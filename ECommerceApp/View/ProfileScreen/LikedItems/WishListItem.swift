//
//  LikedItemsView.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 20/06/25.
//

import SwiftUI
import CoreData

struct WishListItem: View {
    @FetchRequest(
        entity: LikedItems.entity(),
        sortDescriptors: []
    ) var likedItems: FetchedResults<LikedItems>

    var body: some View {
        NavigationView {
            List(likedItems) { item in
                HStack {
                    Image(item.image ?? "")
                        .resizable()
                        .frame(width: 60, height: 60)
                    VStack(alignment: .leading) {
                        Text(item.name ?? "")
                            .font(.headline)
                        Text(item.price ?? "")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
