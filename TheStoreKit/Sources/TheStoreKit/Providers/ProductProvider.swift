//  Created by Maciej Gorecki on 06/08/2023.

import Foundation

public struct ProductProvider {
  public let like: (Product) async throws -> Product
  public let unlike: (Product) async throws -> Product
}

public extension ProductProvider {
  static var inMemory: Self {
    return .init(
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