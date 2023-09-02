//  Created by Maciej Gorecki on 02/09/2023.

import SwiftUI
import TheStoreKit

struct CartItemView: View {
  let product: Product

  let numberFormatter: NumberFormatter = .currency

  var body: some View {
    HStack(alignment: .top, spacing: 18) {
      Rectangle()
        .fill(Color(hex: product.hexColor).opacity(0.5))
        .frame(width: 100)
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

        Text(product.price.asCurrency)
          .font(.caption2)
          .bold()

        Spacer()

        StepperView()
      }

      Spacer()
    }
    .frame(height: 100)
    .padding()
  }
}

#Preview {
  CartItemView(
    product: Product.mock[0]
  )
}
