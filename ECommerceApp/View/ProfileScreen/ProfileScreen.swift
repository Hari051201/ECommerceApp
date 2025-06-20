//
//  ProfileScreen.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 19/06/25.
//

import SwiftUI


struct ProfileScreen: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var profileImage: Image? = Image(systemName: "person.crop.circle.fill")

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                // Profile Image
                profileImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .shadow(radius: 4)

                // Profile Info
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

                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    ProfileScreen()
}
