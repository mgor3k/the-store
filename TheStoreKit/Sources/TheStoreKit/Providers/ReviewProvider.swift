//  Created by Maciej Gorecki on 02/09/2023.

import Foundation

public struct ReviewProvider {
  let fetchReviews: (String) async throws -> [ProductReview]
}

public extension ReviewProvider {
  static var inMemory: Self {
    .init(
      fetchReviews: { id in
        ProductReview.mock
      }
    )
  }
}

public extension ReviewProvider {
  static func server(urlSession: URLSession = .shared) -> Self {
    .init(
      fetchReviews: { id in
        []
      }
    )
  }
}
