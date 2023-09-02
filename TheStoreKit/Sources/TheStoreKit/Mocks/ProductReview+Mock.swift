//  Created by Maciej Gorecki on 02/09/2023.

import Foundation

public extension ProductReview {
  static let mock: [Self] = [
    .init(
      id: "1",
      name: "User 1",
      avatarURL: URL(string: "https://i.pravatar.cc/300")!,
      review: "Review 1"
    ),
    .init(
      id: "2",
      name: "User 2",
      avatarURL: URL(string: "https://i.pravatar.cc/300")!,
      review: "Review 2"
    ),
    .init(
      id: "3",
      name: "User 3",
      avatarURL: URL(string: "https://i.pravatar.cc/300")!,
      review: "Review 3"
    ),
    .init(
      id: "4",
      name: "User 4",
      avatarURL: URL(string: "https://i.pravatar.cc/300")!,
      review: "Review 4"
    ),
    .init(
      id: "5",
      name: "User 5",
      avatarURL: URL(string: "https://i.pravatar.cc/300")!,
      review: "Review 5"
    )
  ]
}
