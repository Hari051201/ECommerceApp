//
//  ECommerceAppApp.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 18/06/25.
//

import SwiftUI
import Firebase
import FirebaseCore
import Stripe


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
    
}
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    StripeAPI.defaultPublishableKey = "pk_test_51Rd3hdFdhuUL8mJLIForNqLKbj2mjh9dcfsnITzt0aRY4iG6NN40UwztPh4pkoGyQ18nffzXnfaH41CrBPedK62u00mcYfn6H8"
    return true
}

@main
struct ECommerceAppApp: App {
    init () {
        StripeAPI.defaultPublishableKey = "pk_test_51Rd3hdFdhuUL8mJLIForNqLKbj2mjh9dcfsnITzt0aRY4iG6NN40UwztPh4pkoGyQ18nffzXnfaH41CrBPedK62u00mcYfn6H8"
    }
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = CoreDataManager.shared
    var body: some Scene {
        WindowGroup {
            SignupScreen()
                .environment(\.managedObjectContext, persistenceController.context)
        }
    }
}
