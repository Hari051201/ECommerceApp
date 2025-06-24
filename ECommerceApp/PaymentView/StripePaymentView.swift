//
//  StripePaymentView.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 23/06/25.
//

import SwiftUI
import Stripe
import StripePaymentSheet


struct StripePaymentView: View {
    @State private var paymentInProgress = false
    @State private var paymentSuccess = false
    @State private var errorMessage: String?

  
    private let cardField = STPPaymentCardTextField()

    var body: some View {
        VStack(spacing: 30) {
            Text("Stripe Payment")
                .font(.title)
                .bold()

            StripeCardField(cardField: cardField)
                .frame(height: 50)
                .padding()

            if paymentInProgress {
                ProgressView()
            }

            Button("Pay ₹100") {
                makePayment()
            }
            .disabled(paymentInProgress)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            if paymentSuccess {
                Text(" Payment successful!")
                    .foregroundColor(.green)
            }

            if let error = errorMessage {
                Text(" \(error)")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }

    func makePayment() {
        paymentInProgress = true
        errorMessage = nil

        let cardParams = cardField.cardParams

        let billingDetails = STPPaymentMethodBillingDetails()
        billingDetails.name = "Test User"

        let paymentMethodCardParams = STPPaymentMethodCardParams()
        paymentMethodCardParams.number = cardParams.number
        paymentMethodCardParams.expMonth = cardParams.expMonth
        paymentMethodCardParams.expYear = cardParams.expYear
        paymentMethodCardParams.cvc = cardParams.cvc

        let paymentMethodParams = STPPaymentMethodParams(
            card: paymentMethodCardParams,
            billingDetails: billingDetails,
            metadata: nil
        )

        
        let paymentIntentClientSecret = "pi_3NYa..._secret_abc123"


        let paymentIntentParams = STPPaymentIntentParams(clientSecret: paymentIntentClientSecret)
        paymentIntentParams.paymentMethodParams = paymentMethodParams

        STPPaymentHandler.shared().confirmPayment(withParams: paymentIntentParams, authenticationContext: StripeAuthContext()) { status, _, error in
            paymentInProgress = false

            switch status {
            case .succeeded:
                paymentSuccess = true
            case .failed:
                errorMessage = error?.localizedDescription ?? "Payment failed"
            case .canceled:
                errorMessage = "Payment canceled"
            @unknown default:
                errorMessage = "Unknown error"
            }
        }
    }

}
