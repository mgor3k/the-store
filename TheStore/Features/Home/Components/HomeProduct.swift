//  Created by Maciej Gorecki on 01/08/2023.

import SwiftUI

struct HomeProduct: View {
  let product: Product

  var body: some View {
    HStack(spacing: 8) {
      Color.blue
        .frame(width: 120, height: 120)

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
    .background(Color.red)
    .clipShape(
      RoundedRectangle(
        cornerRadius: 24,
        style: .continuous
      )
    )
  }
}

#Preview {
  HomeProduct(
    product: .init(
      id: "1", name: "test"
    )
  )
}
