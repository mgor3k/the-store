//  Created by Maciej Gorecki on 02/09/2023.

import SwiftUI
import TheStoreKit

struct CartSummaryView: View {
  let summary: CartSummary

  let numberFormatter: NumberFormatter = .currency

  var body: some View {
    VStack {
      HStack {
        ItemView(
          title: "Subtotal:",
          value: summary.subtotal.asCurrency
        )

        Spacer()

        ItemView(
          title: "Tax:",
          value: summary.tax.asCurrency
        )
      }

      HStack {
        ItemView(
          title: "Shipping:",
          value: summary.shipping.asCurrency
        )

        Spacer()

        ItemView(
          title: "Total:",
          value: summary.total.asCurrency
        )
      }
    }
    .frame(maxWidth: .infinity)
  }

  struct ItemView: View {
    let title: String
    let value: String

    var body: some View {
      HStack {
        Text(title)

        Text(value)
      }
    }
  }
}

#Preview {
  CartSummaryView(
    summary: .mock
  )
}
