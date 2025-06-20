//
//  PantDetailView.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 19/06/25.
//

import SwiftUI
import CoreData

struct PantDetailView: View {
    let product: ProductPants
    
    @State private var isNavigate = false
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.red.opacity(0.2)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        VStack {
                            Image(product.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 350)
                                .cornerRadius(12)
                                .padding()
                            
                            Text(product.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Text(product.price)
                                .font(.title2)
                                .foregroundColor(.gray)
                        }.padding()
                            .frame(width: 350)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                        
                        
                        
                        
                        NavigationLink(
                            destination: AddToCartView(),
                            isActive: $isNavigate
                        ) {
                            EmptyView()
                        }
                        Button(action: {
                            CoreDataManager.shared.saveCartItem(image: product.image, name: product.name, price: product.price)
//                            AddToCartViewShirts(product: product)
                            
                            print("Added to Cart: \(product.name)")
                        }) {
                            Text("Add to Cart")
                                .foregroundColor(.white)
                                .frame(maxWidth: 200)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                            
                            
                        }
                   
                        .padding()
                        
                        
                        
                        
                    }
                    .padding()
                    .frame(width: 450)
                    .navigationTitle("Product Details")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .scrollIndicators(.hidden)
                .padding()
            }
        }
    }
}


