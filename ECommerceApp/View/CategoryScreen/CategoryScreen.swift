//
//  CategoryScreen.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 19/06/25.
//

import SwiftUI



struct CategoryScreen: View {
    var body: some View {
        VStack {
          Text("Welcome to Category Screen")
            
                .foregroundColor(.black)
            
            CategoryCard(category: CategoriesViewPage)
            
        }.frame(width: 410)
//            .background(Color.red)
    }
}


