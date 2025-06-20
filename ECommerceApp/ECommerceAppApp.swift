//
//  ECommerceAppApp.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 18/06/25.
//

import SwiftUI

@main
struct ECommerceAppApp: App {
    let persistenceController = CoreDataManager.shared
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext, persistenceController.context)
        }
    }
}
