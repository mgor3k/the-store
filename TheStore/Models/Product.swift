//  Created by Maciej Gorecki on 01/08/2023.

import Foundation

struct Product: Identifiable {
  let id: String
  let name: String

  var isLiked: Bool
}

extension Product {
  static let mock: [Self] = [
    .init(id: "1", name: "Product 1", isLiked: true),
    .init(id: "2", name: "Product 2", isLiked: false)
  ]
}