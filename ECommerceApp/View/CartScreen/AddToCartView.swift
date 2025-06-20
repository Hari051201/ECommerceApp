//
//  CartScreen.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 19/06/25.
//

import SwiftUI
import CoreData

struct AddToCartView: View {
    @FetchRequest(
        entity: CartItem.entity(),
        sortDescriptors: []
    ) var items: FetchedResults<CartItem>

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if items.isEmpty {
                    Text("No products in the cart.")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(items) { item in
                            NavigationLink(destination: PlaceOrderView(item: item)) {
                                VStack(spacing: 12) {
                                    Image(item.image ?? "")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 200)
                                        .cornerRadius(10)
                                        .shadow(radius: 4)

                                    Text(item.name ?? "")
                                        .font(.headline)

                                    Text(item.price ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(radius: 4)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Cart")
            .background(Color.white.opacity(0.4))
        }
    }
}
