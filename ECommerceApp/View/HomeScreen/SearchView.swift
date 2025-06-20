//
//  TopBarView.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 18/06/25.
//

import SwiftUI


struct SearchView: View {
    var body: some View {
       
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing : 12) {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                    
                    TextField("Search for Products", text: .constant(""))
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
            .padding(.top, 50)
            .padding(.horizontal)
                
                
            }
        
        }
        
    
}

#Preview {
    SearchView()
}
