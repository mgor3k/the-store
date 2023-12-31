//  Created by Maciej Gorecki on 28/08/2023.

import Foundation

public extension Product {
  static let mock: [Self] = [
    .init(
      id: "1",
      name: "Nike Air Pegasus",
      price: 250.40,
      hexColor: "#FFD9D8",
      image: .local("nike1"),
      availableSizes: [34, 35, 36, 37],
      isLiked: true
    ),
    .init(
      id: "2",
      name: "Nike ZoomX",
      price: 99.00,
      hexColor: "#DBE3E6",
      image: .local("nike2"),
      availableSizes: [36, 37, 38, 39, 40, 41, 42, 43, 44, 45],
      isLiked: false
    ),
    .init(
      id: "3",
      name: "Nike Air Jordan",
      price: 56.44,
      hexColor: "#FFD9D8",
      image: .local("nike1"),
      availableSizes: [36, 37, 38, 39, 40, 41, 42, 43, 44, 45],
      isLiked: false
    ),
    .init(
      id: "4",
      name: "Nike Vapormax",
      price: 103.04,
      hexColor: "#DBE3E6",
      image: .local("nike1"),
      availableSizes: [36, 37, 38, 43, 44, 45],
      isLiked: false
    )
  ]
}
