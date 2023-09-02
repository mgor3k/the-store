//  Created by Maciej Gorecki on 02/09/2023.

import SwiftUI
import TheStoreKit

struct CartItemView: View {
  let product: Product

  var body: some View {
    Text(product.name)
  }
}

#Preview {
  CartItemView(
    product: Product.mock[0]
  )
}
