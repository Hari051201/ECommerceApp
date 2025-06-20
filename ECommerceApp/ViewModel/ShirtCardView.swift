//
//  ShirtCardView.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 18/06/25.
//

import SwiftUI

struct ShirtCardView: View {
    let product: ProductShirt

    var body: some View {
        NavigationLink(destination: ShirtDetailView(product: product)) {
            VStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(14)
                    .frame(width: 150, height: 140)

                Text(product.name)
                    .font(.caption)
                    .foregroundColor(.black)
                    .frame(width: 100)
                    .bold()

                Text(product.price)
                    .font(.caption)
            }
            .padding()
            .frame(width: 150, height: 200)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct AddToCartViewShirts: View {
    let product: ProductShirt
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
            Text(product.name).font(.title2).bold()
            Text(product.price).font(.title3).foregroundColor(.gray)
            Spacer()
        }
        .padding()
        .navigationTitle("Pants Detail")
    }
}


struct ShirtListView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(sampleProductsShirt) { product in
                        ShirtCardView(product: product)
                    }
                }
                .padding()
            }
            .navigationTitle("Shirts")
        }
    }
}


struct HorizontalScrollViewShirt: View {
    let products: [ProductShirt]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(products) { product in
                    ShirtCardView(product: product)
                }
            }
            .padding(.horizontal)
        }
    }
}
