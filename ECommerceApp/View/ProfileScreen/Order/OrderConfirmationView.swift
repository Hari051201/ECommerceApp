//
//  OrderConfirmationView.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 20/06/25.
//

import SwiftUI


class OrderManager: ObservableObject {
    static let shared = OrderManager()
    
    @Published var lastOrderedItem: CartItem?
    @Published var fullName: String = ""
    @Published var shippingAddress: String = ""
    @Published var phoneNumber: String = ""
}
struct OrderConfirmationView: View {
    let item: CartItem
    let name: String
    let address: String
    let phone: String
   
    var body: some View {
        VStack(spacing: 20) {
            Text("Order Confirmed!")
                .font(.title)
                .bold()
                .foregroundColor(.green)

            Image(item.image ?? "")
                .resizable()
                .scaledToFit()
                .frame(height: 200)

            VStack(alignment: .leading, spacing: 10) {
                Text("Product: \(item.name ?? "")")
                Text("Price: \(item.price ?? "")")
                Text("Name: \(name)")
                Text("Phone: \(phone)")
                Text("Shipping Address: \(address)")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white.opacity(0.9))
            .cornerRadius(12)
            .shadow(radius: 5)

            Spacer()
        }
        .padding()
        .navigationTitle("Order Summary")
    }
}
