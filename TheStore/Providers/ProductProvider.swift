//  Created by Maciej Gorecki on 06/08/2023.

import Foundation

struct ProductProvider {
  let like: (Product) async throws -> Product
  let unlike: (Product) async throws -> Product
}

extension ProductProvider {
  static var inMemory: Self {
    return .init(
      like: { product in
        Product(
          id: product.id,
          name: product.name,
          price: product.price,
          hexColor: product.hexColor,
          image: product.image,
          isLiked: true
        )
      },
      unlike: { product in
        Product(
          id: product.id,
          name: product.name,
          price: product.price,
          hexColor: product.hexColor,
          image: product.image,
          isLiked: false
        )
      }
    )
  }
}
