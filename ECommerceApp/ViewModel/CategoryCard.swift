//
//  CategoryViewModel.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 19/06/25.
//

import SwiftUI

struct CategoryCard: View {
    var category: [CategoryViewPage]
    var body: some View {
        NavigationView {
        ScrollView {
          
                VStack(spacing: 20) {
                    ForEach(category, id: \.id) { item in
                        HStack{
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .cornerRadius(10)
                            Text(item.name)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .frame(width: 120)
                            Text(item.price)
                                .font(.caption)
                                .foregroundColor(.black)
                            
                        } .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                    
                }
                
                .padding()
                
                
                
            }
        }
//        .navigationBarBackButtonHidden(true)
    }
}


