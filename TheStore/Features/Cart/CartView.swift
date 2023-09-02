//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI
import TheStoreKit

struct CartView: View {
  @EnvironmentObject var cartStore: CartStore

  var body: some View {
    VStack {
      Text("Cart")
        .font(.title)
        .bold()
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 16)

      ForEach(Array(cartStore.items.keys), id: \.id) { product in
        CartItemView(
          product: product
        )
      }

      Spacer()

    }
    .overlay(alignment: .bottom) {
      Text("Total")
        .padding(.bottom)
    }
    .padding(.vertical)
    .pageHorizontalPadding()
  }
}

#Preview {
  CartView()
    .environmentObject(CartStore())
}
