//  Created by Maciej Gorecki on 02/09/2023.

import Foundation

public struct ProductReview: Identifiable {
  public let id: String
  public let name: String
  public let avatarURL: URL
  public let review: String
}
