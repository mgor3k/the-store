//  Created by Maciej Gorecki on 06/08/2023.

import Foundation

public final class ProductStore: ObservableObject {
  @Published public var products: [Product] = []

  private let provider: ProductProvider

  public init(
    provider: ProductProvider = .inMemory
  ) {
    self.provider = provider
  }

  public func loadProducts() async throws {
    products = try await provider.fetchProducts()
  }

  public func isFirst(_ product: Product) -> Bool {
    (products.firstIndex(where: { $0.id == product.id }) ?? -1) == 0
  }

  public func isLast(_ product: Product) -> Bool {
    (products.firstIndex(where: { $0.id == product.id }) ?? -1) == products.count - 1
  }

  public func filteredProducts(
    category: ProductCategory,
    searchPhrase: String
  ) -> [Product] {
    // Temporary
    switch category {
    case .shoes:
      return [products[0], products[3]]
    default:
      return products
    }
  }

  public func toggleLike(_ product: Product) {
    guard let index = products.firstIndex(where: { $0.id == product.id }) else { return }

    let isLiked = product.isLiked

    let tempProduct = Product(
      id: product.id,
      name: product.name,
      price: product.price,
      hexColor: product.hexColor,
      image: product.image,
      availableSizes: product.availableSizes,
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
