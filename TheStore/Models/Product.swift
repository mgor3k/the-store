//  Created by Maciej Gorecki on 01/08/2023.

import Foundation

struct Product: Identifiable, Equatable {
  let id: String
  let name: String

  let hexColor: String
  let image: ImageType

  let isLiked: Bool
}

extension Product {
  static let mock: [Self] = [
    .init(id: "1", name: "Nike Air Pegasus", hexColor: "#FFD9D8", image: .local("nike1"), isLiked: true),
    .init(id: "2", name: "Nike ZoomX", hexColor: "#DBE3E6", image: .local("nike2"), isLiked: false),
    .init(id: "3", name: "Nike Air Jordan", hexColor: "#FFD9D8", image: .local("nike1"), isLiked: false),
    .init(id: "4", name: "Nike Vapormax", hexColor: "#DBE3E6", image: .local("nike1"), isLiked: false)
  ]
}
