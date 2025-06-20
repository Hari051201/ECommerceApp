//
//  ProfileScreen.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 19/06/25.
//
import SwiftUI
import CoreData

struct ProfileScreen: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    
    @State private var isNavigateToWishlist = false
    @State private var isNavigateToOrders = false
    @State private var selectedItem: CartItem? = nil
//    @State private var isNavigateToHelp = false

    @ObservedObject var orderManager = OrderManager.shared

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    
                    // MARK: - Profile Info
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            .shadow(radius: 4)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("Name")
                                    .font(.headline)
                                Spacer()
                                TextField("Enter name", text: $name)
                                    .multilineTextAlignment(.trailing)
                            }

                            HStack {
                                Text("Email")
                                    .font(.headline)
                                Spacer()
                                TextField("Enter email", text: $email)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                    .multilineTextAlignment(.trailing)
                            }

                            HStack {
                                Text("Phone")
                                    .font(.headline)
                                Spacer()
                                TextField("Enter phone", text: $phoneNumber)
                                    .keyboardType(.phonePad)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    
                    // MARK: - Navigation Links
                    NavigationLink(destination: WishListItem(), isActive: $isNavigateToWishlist) {
                        EmptyView()
                    }

                    NavigationLink(
                        destination: selectedItem.map {
                            OrderConfirmationView(
                                item: $0,
                                name: name,
                                address: orderManager.shippingAddress,
                                phone: phoneNumber
                            )
                        },
                        isActive: $isNavigateToOrders
                    ) {
                        EmptyView()
                    }

                    // MARK: - Buttons
                    VStack(spacing: 20) {
                        
                        // Wishlist
                        Button(action: {
                            isNavigateToWishlist = true
                        }) {
                            HStack {
                                Image("wishlist")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                                Text("Wishlist")
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding(.leading, 8)
                            }
                            .padding()
                            .frame(width: 360, alignment: .leading)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(8)
                        }

                        // Orders
                        Button(action: {
                            if let item = orderManager.lastOrderedItem {
                                selectedItem = item
                                name = orderManager.fullName
                                phoneNumber = orderManager.phoneNumber
                                isNavigateToOrders = true
                            } else {
                                print("No recent order found")
                            }
                        }) {
                            HStack {
                                Image("checkout")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                                Text("Orders")
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding(.leading, 8)
                            }
                            .padding()
                            .frame(width: 360, alignment: .leading)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(8)
                        }

                        // Help
//                        NavigationLink(destination: HelpScreen(), isActive: $isNavigateToHelp) {
//                            EmptyView()
//                        }
                        Button(action: {
//                            isNavigateToHelp = true
                            print("Help tapped")
                        }) {
                            HStack {
                                Image("help")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)

                                Text("Help")
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding(.leading, 8)
                            }
                            .padding()
                            .frame(width: 360, alignment: .leading)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(8)
                        }

                        // Logout
                        Button(action: {
                            print("Logout tapped")
                        }) {
                            HStack {
                                Image("logout")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)

                                Text("Logout")
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding(.leading, 8)
                            }
                            .padding()
                            .frame(width: 360, alignment: .leading)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(8)
                        }
                    }
                }
                .padding()
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
