//  Created by Maciej Gorecki on 02/09/2023.

import SwiftUI
import TheStoreKit

struct CartSummaryView: View {
  let summary: CartSummary
  let onCheckout: () -> Void

  let numberFormatter: NumberFormatter = .currency

  var body: some View {
    VStack(spacing: 6) {
      HStack {
        HStack {
          Text("Subtotal:")
          Text(summary.subtotal.asCurrency)
        }

        Spacer()

        HStack {
          Text("Tax:")
          Text(summary.tax.asCurrency)
        }
      }
      .foregroundStyle(.gray)

      HStack {
        HStack {
          Text("Shipping:")
          Text(summary.shipping.asCurrency)
        }
        .foregroundStyle(.gray)

        Spacer()

        HStack {
          Text("Total:")
          Text(summary.total.asCurrency)
        }
      }
      .padding(.bottom, 24)

      Button(
        "Checkout",
        action: onCheckout
      )
      .buttonStyle(.primary)
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .font(.caption2)
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  CartSummaryView(
    summary: .mock,
    onCheckout: {}
  )
}
