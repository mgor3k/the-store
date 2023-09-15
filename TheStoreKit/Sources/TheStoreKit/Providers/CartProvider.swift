//  Created by Maciej Gorecki on 15/09/2023.

import Foundation

public struct CartProvider {
  let fetchCart: () async throws -> [Product: Int]
}

public extension CartProvider {
  static var inMemory: Self {
    .init(
      fetchCart: {
        [:]
      }
    )
  }
}

public extension CartProvider {
  static func server(urlSession: URLSession = .shared) -> Self {
    .init(
      fetchCart: {
        [:]
      }
    )
  }
}
