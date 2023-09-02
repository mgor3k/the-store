//  Created by Maciej Gorecki on 02/09/2023.

import SwiftUI
import TheStoreKit

struct CartItemView: View {
  let product: Product

  static let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()

    formatter.numberStyle = .currency
    formatter.currencyCode = "US"
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 0

    return formatter
  }()

  var formattedPrice: String? {
    Self.numberFormatter.string(from: NSNumber(value: product.price))
  }

  var body: some View {
    HStack(alignment: .top, spacing: 18) {
      Rectangle()
        .fill(Color(hex: product.hexColor).opacity(0.5))
        .frame(width: 60, height: 60)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .overlay {
          DynamicImage(imageType: product.image)
            .padding(4)
            .offset(y: 2)
        }

      VStack(alignment: .leading, spacing: 8) {
        Text(product.name)
          .font(.callout)
          .bold()

        Text(formattedPrice ?? "")
          .font(.caption2)
          .bold()
      }

      Spacer()
    }
    .padding()
  }
}

#Preview {
  CartItemView(
    product: Product.mock[0]
  )
}
