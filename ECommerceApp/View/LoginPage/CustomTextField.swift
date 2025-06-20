//
//  CustomTextField.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 20/06/25.
//

import SwiftUI

struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 30)
            
            if placeholder.lowercased().contains("password") {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
        }
        .padding()
        .frame(width: 300, height: 50)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)

    }
}


