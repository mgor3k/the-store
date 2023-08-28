//  Created by Maciej Gorecki on 01/08/2023.

import Foundation

struct Product: Identifiable, Equatable, Hashable {
  let id: String
  let name: String

  let price: Double

  let hexColor: String
  let image: ImageType

  let isLiked: Bool
}
