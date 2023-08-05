//  Created by Maciej Gorecki on 01/08/2023.

import SwiftUI

struct HomeProduct: View {
  let product: Product

  var body: some View {
    GeometryReader { proxy in
      HStack(spacing: 8) {
        GeometryReader { proxy in
          Color.color1Accent
            .clipShape(
              RoundedRectangle(
                cornerRadius: 12,
                style: .continuous
              )
            )
            .rotationEffect(.degrees(-15))
            .frame(
              width: proxy.size.width * 0.5,
              height: 100
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

          PriceView()
        }
        .padding(24)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .topLeading
        )
      }
      .background(Color.color1)
      .clipShape(
        RoundedRectangle(
          cornerRadius: 28,
          style: .continuous
        )
      )
      .overlay(alignment: .topLeading) {
        Button(action: {}) {
          Image(systemName: product.isLiked ? "heart.fill" : "heart")
            .font(.caption)
            .padding(6)
            .background(Color.white)
            .clipShape(Circle())
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 12)
      }
    }
    .frame(height: 180)
  }
}

#Preview {
  HomeProduct(
    product: .init(
      id: "1",
      name: "test",
      isLiked: true
    )
  )
}