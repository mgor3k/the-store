//  Created by Maciej Gorecki on 10/08/2023.

import SwiftUI

struct DetailsView: View {
  let namespace: Namespace.ID

  let product: Product

  var body: some View {
    ZStack {
      Color.white.ignoresSafeArea()

      VStack {
        DynamicImage(
          imageType: product.image
        )
        .matchedGeometryEffect(
          id: "image+\(product.id)",
          in: namespace
        )
        .padding()
        .background(
          Color(hex: product.hexColor)
            .opacity(0.5)
            .clipShape(
              RoundedRectangle(
                cornerRadius: 28,
                style: .continuous
              )
            )
            .matchedGeometryEffect(
              id: "background+\(product.id)",
              in: namespace
            )
        )
        .padding()

        Spacer()
      }
    }
  }
}

#Preview {
  @Namespace var namespace

  return DetailsView(
    namespace: namespace,
    product: Product.mock[0]
  )
}
