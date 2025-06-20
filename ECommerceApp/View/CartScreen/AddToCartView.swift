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
        VStack {
            if items.isEmpty {
            
                Text("No products in the cart.")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                // Cart list
                List(items) { item in
                    VStack(spacing: 20) {
                        VStack {
                            Text(item.name ?? "")
                                .font(.headline)
                                .padding(.trailing, 20)
                                .cornerRadius(10)

                            Text(item.price ?? "")
                                .font(.subheadline)

                            Image(item.image ?? "")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .padding()
                        .frame(width: 350)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                    .padding()
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Cart")
        .background(Color(.systemGroupedBackground))
    }
}

