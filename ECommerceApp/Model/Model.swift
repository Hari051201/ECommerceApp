//
//  Model.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 18/06/25.
//

import SwiftUI

struct Deal: Identifiable {
    let id = UUID()
    let title: String
    let price: String
    let imageName: String
}

let sampleDeals: [Deal] = [
    Deal(title: "Wireless Headphones", price: "₹1999", imageName: "headset"),
    Deal(title: "Smartwatch", price: "₹2999", imageName: "smartwatch"),
    Deal(title: "iPhone 15", price: "₹74999", imageName: "iphone"),
]


protocol CategoryItem: Identifiable {
    var id: UUID { get }
    var name: String { get }
    var price: String { get }
    var image: String { get }
}

struct ProductCardHomeView: CategoryItem {
    let id = UUID()
    let image: String
    let name: String
    let price: String
}

struct CategoryViewPage: CategoryItem {
    let id = UUID()
    let image: String
    let name: String
    let price: String
}

let ProductCardView: [ProductCardHomeView] = [
    
    ProductCardHomeView(image: "kilos", name: "Kilos", price: ""),
    ProductCardHomeView(image: "mobiles", name: "Mobiles", price: ""),
    ProductCardHomeView(image: "fashion", name: "Fashion", price: ""),
    ProductCardHomeView(image: "electronics", name: "Electronics", price: ""),
    ProductCardHomeView(image: "Home", name: "Home & Furniture", price: ""),
    ProductCardHomeView(image: "appliance", name: "Appliances", price: ""),
    ProductCardHomeView(image: "flight", name: "Flight", price: ""),
    ProductCardHomeView(image: "beauty", name: "Beauty, Toys & More", price: ""),
    ProductCardHomeView(image: "two", name: "Two Wheelers", price: "")
    ]

let CategoriesViewPage: [CategoryViewPage] = [
    
    CategoryViewPage(image: "kilos", name: "Kilos", price: "Rs. 299"),
    CategoryViewPage(image: "mobiles", name: "Mobiles", price: "Rs. 15,000"),
    CategoryViewPage(image: "shirt1", name: "Men Solid Casual", price: "Rs. 599"),
    CategoryViewPage(image: "electronics", name: "Electronics", price: "Rs. 2000"),
    CategoryViewPage(image: "appliance", name: "Appliances", price: "Rs. 399"),
    CategoryViewPage(image: "beauty", name: "Beauty, Toys & More", price: "Rs. 599"),
    CategoryViewPage(image: "two", name: "Two Wheeler", price: "Rs. 50,000")
    ]
    
//    CategoryViewPage(imageName: "kilos", label: "Kilos"),
//    CategoryViewPage(imageName: "mobiles", label: "Mobiles"),
//    CategoryViewPage(imageName: "mobiles", label: "Fashion"),
//    CategoryViewPage(imageName: "electronics", label: "Electronics"),
//    CategoryViewPage(imageName: "Home", label: "Home & Furniture"),
//    CategoryViewPage(imageName: "appliance", label: "Appliances"),
//    CategoryViewPage(imageName: "flight", label: "Flight Bookings"),
//    CategoryViewPage(imageName: "beauty", label: "Beauty, Toys & More"),
//    CategoryViewPage(imageName: "two", label: "Two Wheelers")
//]




protocol Product: Identifiable {
    var id: UUID { get }
    var name: String { get }
    var price: String { get }
    var image: String { get }
}

struct ProductShirt: Product {
    let id = UUID()
    let image: String
    let name: String
    let price: String
}

struct ProductShoes: Product {
    let id = UUID()
    let image: String
    let name: String
    let price: String
}


struct ProductPants: Product {
    let id = UUID()
    let image: String
    let name: String
    let price: String
}


let sampleProductsShirt: [ProductShirt] = [
    ProductShirt(image: "shirt1", name: "Men Slim Fit", price: "Rs. 499"),
    ProductShirt(image: "shirt2", name: "Men Regular Fit", price: "Rs. 399"),
    ProductShirt(image: "shirt3", name: "Men Solid Casual", price: "Rs. 599"),
    ProductShirt(image: "shirt4", name: "Men Cotton Fit", price: "Rs. 349")
]


let sampleProductsShoes: [ProductShoes] = [
    ProductShoes(image: "shoe1", name: "Rebook", price: "Rs. 699"),
    ProductShoes(image: "shoe2", name: "Adidas", price: "Rs. 950"),
    ProductShoes(image: "shoe3", name: "Puma", price: "Rs. 1000"),
    ProductShoes(image: "shoe4", name: "Sparkx", price: "Rs. 5999")
]

let sampleProductsPants: [ProductPants] = [
    ProductPants(image: "pant1", name: "Regular Fit Pant", price: "Rs. 499"),
    ProductPants(image: "pant2", name: "US Polo Casual", price: "Rs. 699"),
    ProductPants(image: "pant3", name: "Regular Cotton Fit", price: "Rs. 599"),
    ProductPants(image: "pant4", name: "Regular cargo Fit", price: "Rs. 349")
]
