//  Created by Maciej Gorecki on 02/09/2023.

import SwiftUI

struct CartSummaryView: View {
  let subtotal: Double
  let tax: Double
  let shipping: Double
  let total: Double

  let numberFormatter: NumberFormatter = .currency

  var body: some View {
    VStack {
      HStack {
        ItemView(
          title: "Subtotal:",
          value: subtotal.asCurrency
        )

        Spacer()

        ItemView(
          title: "Tax:",
          value: tax.asCurrency
        )
      }

      HStack {
        ItemView(
          title: "Shipping:",
          value: shipping.asCurrency
        )

        Spacer()

        ItemView(
          title: "Total:",
          value: total.asCurrency
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
    subtotal: 100,
    tax: 200,
    shipping: 300,
    total: 400
  )
}
