//
//  HelpScreen.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 20/06/25.
//

import SwiftUI

//
//struct HelpScreen: View {
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(spacing: 24) {
//
//                    // MARK: - Help Topics
//                    VStack(alignment: .leading, spacing: 16) {
//                        Text("Help Topics")
//                            .font(.title2)
//                            .bold()
//                            .padding(.horizontal)
//
//                        HelpTopicRow(icon: "shippingbox.fill", title: "Track Your Order")
//                        HelpTopicRow(icon: "arrow.2.circlepath.circle", title: "Return & Refund")
//                        HelpTopicRow(icon: "creditcard.fill", title: "Payment Issues")
//                        HelpTopicRow(icon: "person.crop.circle.fill", title: "Account Settings")
//                        HelpTopicRow(icon: "questionmark.circle.fill", title: "Other Issues")
//                    }
//
//                    Divider()
//
//                    // MARK: - Contact Us
//                    VStack(alignment: .leading, spacing: 16) {
//                        Text("Need More Help?")
//                            .font(.title2)
//                            .bold()
//                            .padding(.horizontal)
//
//                        HelpContactOption(title: "Chat with us", icon: "message.fill", action: {
//                            print("Chat tapped")
//                        })
//
//                        HelpContactOption(title: "Call us", icon: "phone.fill", action: {
//                            print("Call tapped")
//                        })
//
//                        HelpContactOption(title: "Email us", icon: "envelope.fill", action: {
//                            print("Email tapped")
//                        })
//                    }
//                }
//                .padding(.vertical)
//            }
//            .navigationTitle("Help Center")
//        }
//    }
//}
//
//// MARK: - Help Topic Row
//struct HelpTopicRow: View {
//    let icon: String
//    let title: String
//
//    var body: some View {
//        HStack(spacing: 16) {
//            Image(systemName: icon)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 26, height: 26)
//                .foregroundColor(.blue)
//
//            Text(title)
//                .font(.body)
//                .foregroundColor(.black)
//
//            Spacer()
//
//            Image(systemName: "chevron.right")
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .background(Color.gray.opacity(0.1))
//        .cornerRadius(10)
//        .padding(.horizontal)
//    }
//}
//
//// MARK: - Contact Option Row
//struct HelpContactOption: View {
//    let title: String
//    let icon: String
//    let action: () -> Void
//
//    var body: some View {
//        Button(action: action) {
//            HStack(spacing: 16) {
//                Image(systemName: icon)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 22, height: 22)
//                    .foregroundColor(.white)
//                    .padding(10)
//                    .background(Color.blue)
//                    .clipShape(Circle())
//
//                Text(title)
//                    .font(.body)
//                    .foregroundColor(.blue)
//
//                Spacer()
//
//                Image(systemName: "chevron.right")
//                    .foregroundColor(.gray)
//            }
//            .padding()
//            .background(Color.white)
//            .cornerRadius(10)
//            .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
//            .padding(.horizontal)
//        }
//    }
//}
//
//#Preview {
//    HelpScreen()
//}
