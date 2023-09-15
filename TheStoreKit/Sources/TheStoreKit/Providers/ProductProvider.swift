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
  static func server(urlSession: URLSession = .shared) -> Self {
    .init(
      fetchProducts: {
        []
      },
      like: { product in
        product
      },
      unlike: { product in
        product
      }
    )
  }
}
