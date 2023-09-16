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
    // TODO: Add simple networking layer and cleanup
    return .init(
      fetchProducts: {
        let url = URL(string: "http://127.0.0.1:8080/products")!
        let request = URLRequest(url: url)
        let (data, _) = try await urlSession.data(for: request)
        let decoded = try JSONDecoder().decode([Product].self, from: data)
        return decoded
      },
      like: { product in
        let id = product.id
        let url = URL(string: "http://127.0.0.1:8080/products/\(id)/like")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        let (data, _) = try await urlSession.data(for: request)
        let decoded = try JSONDecoder().decode(Product.self, from: data)
        return decoded
      },
      unlike: { product in
        let id = product.id
        let url = URL(string: "http://127.0.0.1:8080/products/\(id)/dislike")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        let (data, _) = try await urlSession.data(for: request)
        let decoded = try JSONDecoder().decode(Product.self, from: data)
        return decoded
      }
    )
  }
}
