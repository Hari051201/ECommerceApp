//
//  TabView.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 19/06/25.
//

import SwiftUI


struct TabBarView: View {
    var body: some View {
//        let categories = sampleCategoriesViewPage
        let product: ProductShirt

        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            CategoryScreen()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Categories")
                }
            
            
            
            AddToCartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
               
            
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
               
        }
    }
}


#Preview {
    TabBarView()
}
