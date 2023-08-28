//  Created by Maciej Gorecki on 01/08/2023.

import Foundation

public struct Product: Identifiable, Equatable, Hashable {
  public let id: String
  public let name: String

  public let price: Double

  public let hexColor: String
  public let image: ImageType

  public let availableSizes: [Size]

  public let isLiked: Bool
}
