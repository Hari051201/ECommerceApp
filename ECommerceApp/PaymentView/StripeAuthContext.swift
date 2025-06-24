//
//  StripeAuthContext.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 23/06/25.
//

import SwiftUI
import Stripe

class StripeAuthContext: NSObject, STPAuthenticationContext {
    func authenticationPresentingViewController() -> UIViewController {
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows.first?.rootViewController }
            .first ?? UIViewController()
    }
}
