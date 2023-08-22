//  Created by Maciej Gorecki on 01/08/2023.

import Foundation

struct Product: Identifiable, Equatable, Hashable {
  let id: String
  let name: String

  let price: Double

  let hexColor: String
  let image: ImageType

  let isLiked: Bool

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

extension Product {
  static let mock: [Self] = [
    .init(id: "1", name: "Nike Air Pegasus", price: 250.40, hexColor: "#FFD9D8", image: .local("nike1"), isLiked: true),
    .init(id: "2", name: "Nike ZoomX", price: 99.00, hexColor: "#DBE3E6", image: .local("nike2"), isLiked: false),
    .init(id: "3", name: "Nike Air Jordan", price: 56.44, hexColor: "#FFD9D8", image: .local("nike1"), isLiked: false),
    .init(id: "4", name: "Nike Vapormax", price: 103.04, hexColor: "#DBE3E6", image: .local("nike1"), isLiked: false)
  ]
}
