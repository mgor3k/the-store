//  Created by Maciej Gorecki on 02/09/2023.

import SwiftUI
import TheStoreKit

struct CartItemView: View {
  @EnvironmentObject var cartStore: CartStore

  let namespace: Namespace.ID
  let product: Product
  let onImageTapped: () -> Void

  let numberFormatter: NumberFormatter = .currency

  var body: some View {
    HStack(alignment: .top, spacing: 18) {
      DynamicImage(imageType: product.image)
        .matchedGeometryEffect(
          id: MatchedGeometry.Cart.image(id: product.id),
          in: namespace
        )
        .offset(y: 2)
        .frame(width: 80)
        .background(
          Color(hex: product.hexColor)
            .opacity(0.5)
            .clipShape(
              RoundedRectangle(
                cornerRadius: 8,
                style: .continuous
              )
            )
            .rotationEffect(.degrees(-7))
            .matchedGeometryEffect(
              id: MatchedGeometry.Cart.background(id: product.id),
              in: namespace
            )
            .padding(12)
        )
        .onTapGesture(
          perform: onImageTapped
        )

      VStack(alignment: .leading, spacing: 8) {
        Text(product.name)
          .font(.callout)
          .bold()

        Text(product.price.asCurrency)
          .font(.caption2)
          .bold()

        Spacer()

        StepperView(
          value: cartStore.quantity(for: product),
          onIncrement: { cartStore.incrementQuantity(for: product) },
          onDecrement: { cartStore.decrementQuantity(for: product) }
        )
      }

      Spacer()
    }
    .frame(height: 80)
    .padding()
  }
}

#Preview {
  @Namespace var namespace

  return CartItemView(
    namespace: namespace,
    product: Product.mock[0],
    onImageTapped: {}
  )
}
