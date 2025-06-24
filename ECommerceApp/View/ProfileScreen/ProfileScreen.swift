//
//  ProfileScreen.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 19/06/25.
//
import SwiftUI
import CoreData
import Firebase
import FirebaseAuth
import PhotosUI

struct ProfileScreen: View {
    @ObservedObject var session = UserSession.shared
    @Environment(\.managedObjectContext) private var viewContext

    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var isNavigate = false

    @State private var isNavigateToWishlist = false
    @State private var isNavigateToOrders = false
    @State private var selectedItem: CartItem? = nil

    @ObservedObject var orderManager = OrderManager.shared

    // Profile image
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var profileImage: Image? = nil
    @State private var profileUIImage: UIImage? = nil

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {

                    // MARK: - Profile Info
                    VStack(spacing: 10) {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                .shadow(radius: 4)
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                .shadow(radius: 4)
                        }

                        PhotosPicker(selection: $selectedPhoto, matching: .images) {
                            Text("Change Photo")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }

                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("Name:                Hari")
                                    .font(.headline)
                                Spacer()
                            }

                            HStack {
                                Text("Email:                hari10@gmail.com")
                                    .font(.headline)
                                Spacer()
                            }

//                            HStack {
//                                Text("Phone:   \(session.phone)")
//                                    .font(.headline)
//                                Spacer()
//                            }
                        }
                        .padding(.top, 10)
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
                        Button(action: {
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
                        NavigationLink(destination: LoginView(), isActive: $isNavigate) {
                            EmptyView()
                        }

                        Button(action: {
                            do {
                                try Auth.auth().signOut()
                                isLoggedIn = false
                            } catch {
                                print("Logout failed: \(error.localizedDescription)")
                            }
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
                .onAppear {
                    fetchUserFromCoreData()
                }
                .onChange(of: selectedPhoto) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            profileUIImage = uiImage
                            profileImage = Image(uiImage: uiImage)
                        }
                    }
                }
            }
        }
    }

    // MARK: - Fetch from Core Data
    func fetchUserFromCoreData() {
        let fetchRequest: NSFetchRequest<UserProfile> = UserProfile.fetchRequest()
        do {
            if let user = try viewContext.fetch(fetchRequest).first {
                session.name = user.name ?? ""
                session.email = user.email ?? ""
                session.phone = user.phone ?? ""
                print("✅ User loaded into session")
            } else {
                print("⚠️ No user found in Core Data")
            }
        } catch {
            print("❌ Failed to fetch user: \(error)")
        }
    }
}
