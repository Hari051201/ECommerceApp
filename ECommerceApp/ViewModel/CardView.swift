//
//  CardView.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 18/06/25.
//

import SwiftUI

struct CardView: View {
    let deal: Deal

    var body: some View {
        HStack(spacing: 16) {
            Image(deal.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 6) {
                Text(deal.title)
                    .font(.headline)

                Text(deal.price)
                    .font(.subheadline)
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}

