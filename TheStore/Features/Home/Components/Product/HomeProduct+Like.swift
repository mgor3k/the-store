//  Created by Maciej Gorecki on 06/08/2023.

import SwiftUI

extension HomeProduct {
  struct LikeButton: View {
    @EnvironmentObject var store: ProductStore

    let product: Product

    var body: some View {
      Button(action: toggleLike) {
        Image(
          systemName: product.isLiked ? "heart.fill" : "heart"
        )
        .font(.caption)
        .padding(6)
        .background(Color.white)
        .clipShape(Circle())
      }
    }

    func toggleLike() {
      store.toggleLike(product)
    }
  }
}

#Preview {
  HomeProduct.LikeButton(
    product: Product.mock[0]
  )
    .environmentObject(ProductStore())
}
