//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI
import TheStoreKit

struct CartView: View {
  @EnvironmentObject var cartStore: CartStore

  let namespace: Namespace.ID
  @Binding var selectedProduct: Product?

  var body: some View {
    VStack {
      Text("Cart")
        .font(.title)
        .bold()
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 16)

      ForEach(Array(cartStore.items.keys), id: \.id) { product in
        CartItemView(
          namespace: namespace,
          product: product,
          onImageTapped: {
            selectedProduct = product
          }
        )
        .transition(.slide)
      }

      Spacer()

    }
    .animation(.snappy, value: cartStore.items.keys)
    .overlay(alignment: .bottom) {
      CartSummaryView(
        summary: cartStore.summary,
        onCheckout: checkout
      )
      .padding()
      .padding(.bottom, 8)
    }
    .padding(.vertical)
    .pageHorizontalPadding()
  }

  private func checkout() {
    // TODO: Add loader
    Task {
      await cartStore.checkout()
    }
  }
}

#Preview {
  @Namespace var namespace

  return CartView(
    namespace: namespace,
    selectedProduct: .constant(nil)
  )
  .environmentObject(CartStore())
}
