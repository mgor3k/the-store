//  Created by Maciej Gorecki on 01/08/2023.

import Foundation

struct Product: Identifiable {
  let id: String
  let name: String

  let hexColor: String

  var isLiked: Bool
}

extension Product {
  static let mock: [Self] = [
    .init(id: "1", name: "Nike Air Pegasus", hexColor: "#FFD9D8", isLiked: true),
    .init(id: "2", name: "Nike ZoomX", hexColor: "#DBE3E6", isLiked: false),
    .init(id: "3", name: "Nike Air Jordan", hexColor: "#FFD9D8", isLiked: false),
    .init(id: "4", name: "Nike Vapormax", hexColor: "#DBE3E6", isLiked: false)
  ]
}
