//  Created by Maciej Gorecki on 15/09/2023.

import Foundation

public struct CartProvider {
  let fetchCart: () async throws -> [Product: Int]
  let updateCart: (String, Int) async throws -> Void
}

public extension CartProvider {
  static func inMemory(cart: [Product: Int] = [:]) -> Self {
    .init(
      fetchCart: {
        cart
      },
      updateCart: { _, _ in
        // Ignore
      }
    )
  }
}

public extension CartProvider {
  static func server(network: NetworkClient = .live) -> Self {
    .init(
      fetchCart: {
        struct CartItem: Decodable {
          let product: Product
          let quantity: Int
        }

        let response: [CartItem] = try await network.data(for: .cart)

        var cart: [Product: Int] = [:]

        response.forEach { item in
          cart[item.product] = item.quantity
        }

        return cart
      },
      updateCart: { id, quantity in
        try await network.request(for: .updateCart(id: id, quantity: quantity), method: .post)
      }
    )
  }
}
