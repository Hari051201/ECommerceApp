//
//  StripeCardField.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 23/06/25.
//

import SwiftUI
import Stripe

struct StripeCardField: UIViewRepresentable {
    let cardField: STPPaymentCardTextField

    func makeUIView(context: Context) -> STPPaymentCardTextField {
        return cardField
    }

    func updateUIView(_ uiView: STPPaymentCardTextField, context: Context) {}
}

