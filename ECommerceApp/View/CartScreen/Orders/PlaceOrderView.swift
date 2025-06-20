//
//  OrderProducts.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 20/06/25.
//

import SwiftUI
import CoreData

struct PlaceOrderView: View {
    let item: CartItem
    @State private var isNavigateToAddress = false
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.white.opacity(0.2)
                    .ignoresSafeArea()
                ScrollView {
                    
                    VStack(spacing: 20) {
                        VStack {
                            Image(item.image ?? "")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 350)
                                .cornerRadius(12)
                                .padding()
                            
                            Text(item.name ?? "")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text(item.price ?? "")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .frame(width: 350)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        
                        
                        // NavigationLink Trigger
                        NavigationLink(destination: AddressView(item: item), isActive: $isNavigateToAddress) {
                            EmptyView()
                        }
                        
                        Button(action: {
                            isNavigateToAddress = true
                        }) {
                            Text("Place Order")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: 200)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        .padding(.top, 50)
                    }
                    .padding()
                    .frame(width: 450)
                    
                }
            }
        }
        .navigationTitle("Place Order")
    }
}

