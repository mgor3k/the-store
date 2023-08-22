//  Created by Maciej Gorecki on 06/08/2023.

import Foundation

final class ProductStore: ObservableObject {
  @Published var products: [Product]

  private let provider: ProductProvider

  init(
    products: [Product] = Product.mock,
    provider: ProductProvider = .inMemory
  ) {
    self.products = products
    self.provider = provider
  }

  func isFirst(_ product: Product) -> Bool {
    (products.firstIndex(where: { $0.id == product.id }) ?? -1) == 0
  }

  func isLast(_ product: Product) -> Bool {
    (products.firstIndex(where: { $0.id == product.id }) ?? -1) == products.count - 1
  }

  func toggleLike(_ product: Product) {
    guard let index = products.firstIndex(where: { $0.id == product.id }) else { return }

    let isLiked = product.isLiked

    let tempProduct = Product(
      id: product.id,
      name: product.name,
      price: product.price,
      hexColor: product.hexColor,
      image: product.image,
      isLiked: !isLiked
    )

    products[index] = tempProduct

    Task {
      do {
        let newProduct = try await isLiked
        ? provider.unlike(product)
        : provider.like(product)

        await MainActor.run {
          products[index] = newProduct
        }
      } catch {
        // TODO: Error handling
        // Revert to original state, show error, or whatever
        await MainActor.run {
          products[index] = product
        }
      }
    }
  }
}
