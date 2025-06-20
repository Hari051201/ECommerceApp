//
//  CategoryView.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 18/06/25.
//

import SwiftUI

struct ProductCard: View {
    var Product: [ ProductCardHomeView]
    
    var body: some View {
        NavigationLink(destination: CategoryScreen()) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(Product, id: \.id) { item in
                        VStack(spacing: 8) {
                            Image(item.image)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Text(item.name)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .frame(width: 80)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

