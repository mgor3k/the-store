//  Created by Maciej Gorecki on 01/08/2023.

import SwiftUI

struct HomeProduct: View {
  let product: Product

  var body: some View {
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
            width: proxy.size.width / 2.5,
            height: 90
          )
          .padding()
          .frame(
            width: proxy.size.width,
            height: proxy.size.height,
            alignment: .center
          )
      }

      VStack(alignment: .leading, spacing: 16) {
        VStack(alignment: .leading) {
          Text(product.name)
            .font(.title)

          Text("by nike")
            .font(.callout)
            .foregroundStyle(.secondary)
        }

        Text("Your workhorse with wing returns.")
          .font(.callout)
          .foregroundStyle(.secondary)
      }

      Spacer()
    }
    .frame(height: 180)
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
