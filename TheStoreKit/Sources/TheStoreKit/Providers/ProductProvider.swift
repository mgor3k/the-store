//  Created by Maciej Gorecki on 06/08/2023.

import Foundation

public struct ProductProvider {
  let fetchProducts: () async throws -> [Product]
  let like: (Product) async throws -> Product
  let unlike: (Product) async throws -> Product
}

public extension ProductProvider {
  static var inMemory: Self {
    return .init(
      fetchProducts: {
        Product.mock
      },
      like: { product in
        Product(
          id: product.id,
          name: product.name,
          price: product.price,
          hexColor: product.hexColor,
          image: product.image,
          availableSizes: product.availableSizes,
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
          availableSizes: product.availableSizes,
          isLiked: false
        )
      }
    )
  }
}

public extension ProductProvider {
  static func server(network: NetworkClient = .live) -> Self {
    .init(
      fetchProducts: {
        try await network.data(
          for: .products
        )
      },
      like: { product in
        try await network.data(
          for: .like(id: product.id),
          method: .put
        )
      },
      unlike: { product in
        try await network.data(
          for: .dislike(id: product.id),
          method: .put
        )
      }
    )
  }
}
