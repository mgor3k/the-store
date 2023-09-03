//  Created by Maciej Gorecki on 01/08/2023.

import SwiftUI
import TheStoreKit

struct ProductView: View {
  @EnvironmentObject var store: ProductStore

  let namespace: Namespace.ID

  let product: Product

  let onBuyTapped: () -> Void

  var body: some View {
    GeometryReader { proxy in
      HStack(spacing: 8) {
        GeometryReader { proxy in
          Color(hex: product.hexColor)
            .clipShape(
              RoundedRectangle(
                cornerRadius: 12,
                style: .continuous
              )
            )
            .rotationEffect(.degrees(-15))
            .frame(
              width: proxy.size.width * 0.5,
              height: 90
            )
            .offset(x: 16)
            .padding()
            .frame(
              width: proxy.size.width,
              height: proxy.size.height,
              alignment: .center
            )
        }
        .frame(width: proxy.size.width * 0.4)
        .overlay {
          DynamicImage(imageType: product.image)
            .matchedGeometryEffect(
              id: MatchedGeometry.Home.image(id: product.id),
              in: namespace
            )
            .offset(x: 16, y: 12)
            .padding(12)
        }

        VStack(alignment: .leading, spacing: 0) {
          VStack(alignment: .leading) {
            Text(product.name)
              .font(.callout)
              .bold()

            Text("by nike")
              .font(.caption)
              .foregroundStyle(.secondary)
          }
          .padding(.bottom, 16)

          Text("Your workhorse with wing returns.")
            .font(.caption)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.leading)

          Spacer()

          HStack {
            PriceView(
              price: product.price
            )

            Spacer()

            AnimatableButton(
              title: "Add",
              action: onBuyTapped
            )
          }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .topLeading
        )
      }
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
            id: MatchedGeometry.Home.background(id: product.id),
            in: namespace
          )
      )
      .overlay(alignment: .topLeading) {
        LikeButton(product: product)
          .padding(.vertical, 14)
          .padding(.horizontal, 12)
      }
    }
    .frame(height: 180)
  }
}

#Preview {
  @Namespace var namespace

  return ProductView(
    namespace: namespace,
    product: Product.mock[0],
    onBuyTapped: {}
  )
  .environmentObject(ProductStore())
}
