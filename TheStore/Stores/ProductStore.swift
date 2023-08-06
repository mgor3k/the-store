//  Created by Maciej Gorecki on 06/08/2023.

import Foundation

final class ProductStore: ObservableObject {
  @Published var products: [Product] = Product.mock

  func toggleLike(_ product: Product) {
    var isLiked = product.isLiked
    isLiked.toggle()

    let newProduct = Product(id: product.id, name: product.name, hexColor: product.hexColor, isLiked: isLiked)

    let index = products.firstIndex(where: { $0.id == product.id }) ?? 0

    products[index] = newProduct
  }
}
