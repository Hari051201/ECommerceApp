//
//  PantCardView.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 19/06/25.
//

import SwiftUI

struct PantCardView: View {
    let product: ProductPants
    
    var body: some View {
        NavigationLink(destination: PantDetailView(product: product)) {
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



struct AddToCartViewPants: View {
    let product: ProductPants
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

struct HorizontalScrollViewPants: View {
    let products: [ProductPants]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(products) { product in
                    PantCardView(product: product)
                }
            }
            .padding()
        }
    }
}

