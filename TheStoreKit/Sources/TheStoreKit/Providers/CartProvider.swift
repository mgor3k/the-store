//  Created by Maciej Gorecki on 15/09/2023.

import Foundation

public struct CartProvider {
  let fetchCart: () async throws -> [Product: Int]
}

public extension CartProvider {
  static var inMemory: Self {
    var products: [Product] = Product.mock
    var cart: [Product: Int] = [
      products[0]: 1,
      products[1]: 2
    ]
    
    return .init(
      fetchCart: {
        cart
      }
    )
  }
}
