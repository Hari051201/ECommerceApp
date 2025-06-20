//
//  HomeScreen.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 18/06/25.
//

import SwiftUI

struct HomeScreen: View {
    @State private var searchText = ""
    
    var filteredShirts: [ProductShirt] {
        searchText.isEmpty ? sampleProductsShirt :
        sampleProductsShirt.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    
    var filteredShoes: [ProductShoes] {
        searchText.isEmpty ? sampleProductsShoes :
        sampleProductsShoes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var filteredPants: [ProductPants] {
        searchText.isEmpty ? sampleProductsPants :
        sampleProductsPants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Search Bar
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                    
                    TextField("Search for Products", text: $searchText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding([.top, .horizontal])
                
                // Deals Section
                Text("Today's Deals")
                    .font(.title2.bold())
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(sampleDeals) { deal in
                            CardView(deal: deal)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Category View
                ProductCard(Product: ProductCardView)
                
                // Product Listings
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        
                        if !filteredShirts.isEmpty || searchText.isEmpty {
                            Group {
                                // Shirt Section
                                Text("Shirts")
                                    .font(.title2.bold())
                                    .padding(.horizontal, 10)
                                
                                if filteredShirts.isEmpty {
                                    Text("No Shirts Found")
                                        .foregroundColor(.gray)
                                        .padding(.horizontal)
                                } else {
                                    HorizontalScrollViewShirt(products: filteredShirts)
                                }
                                
                            }
                        }
                        
                        
                        if !filteredShoes.isEmpty || searchText.isEmpty {
                            Group {
                                Text("Shoes")
                                    .font(.title2.bold())
                                    .padding(.horizontal, 10)
                                
                                if filteredShoes.isEmpty {
                                    Text("No Shoes Found")
                                        .foregroundColor(.gray)
                                        .padding(.horizontal)
                                } else {
                                    HorizontalScrollViewShoes(products: filteredShoes)
                                }
                            }
                        }
                        
                        
                        if !filteredPants.isEmpty || searchText.isEmpty {
                            Group {
                                Text("Pants")
                                    .font(.title2.bold())
                                    .padding(.horizontal, 10)
                                
                                if filteredPants.isEmpty {
                                    Text("No Pants Found")
                                        .foregroundColor(.gray)
                                        .padding(.horizontal)
                                } else {
                                    HorizontalScrollViewPants(products: filteredPants)
                                }
                            }
                        }
                    }
                }
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.white)
        }
    }
}



#Preview {
    HomeScreen()
}
