//
//  CoreDataManager.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 19/06/25.
//

import SwiftUI
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data loading failed: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        container.viewContext
    }

    func saveCartItem(image: String, name: String, price: String) {
        let newItem = CartItem(context: context)
        newItem.image = image
        newItem.name = name
        newItem.price = price

        do {
            try context.save()
            print("✅ Saved to cart")
        } catch {
            print("❌ Failed to save: \(error)")
        }
    }
}
