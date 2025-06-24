//
//  AddressScreen.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 20/06/25.
//
import SwiftUI

struct AddressView: View {
    let item: CartItem
    
    @State private var fullName: String = ""
    @State private var address: String = ""
    @State private var phone: String = ""
    
    @State private var isOrderPlaced = false
    @State private var navigateToStripe = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Shipping Address")
                    .font(.title2)
                    .bold()

                TextField("Full Name", text: $fullName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Address", text: $address)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Phone Number", text: $phone)
                    .keyboardType(.phonePad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                // Navigation to StripePaymentView
                NavigationLink(destination: StripePaymentView(), isActive: $navigateToStripe) {
                    EmptyView()
                }

                Button(action: {
                    if !fullName.isEmpty && !address.isEmpty && !phone.isEmpty {
                        // Save to shared manager (optional)
                        let manager = OrderManager.shared
                        manager.lastOrderedItem = item
                        manager.fullName = fullName
                        manager.shippingAddress = address
                        manager.phoneNumber = phone

                        // Trigger navigation to payment
                        navigateToStripe = true
                    }
                }) {
                    Text("Confirm Order")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.top, 30)

                Spacer()
            }
            .padding()
            .navigationTitle("Enter Address")
        }
    }
}
