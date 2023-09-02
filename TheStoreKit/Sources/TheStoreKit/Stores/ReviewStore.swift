//  Created by Maciej Gorecki on 02/09/2023.

import Foundation

public final class ReviewStore: ObservableObject {
  private let provider: ReviewProvider

  public init(provider: ReviewProvider = .inMemory) {
    self.provider = provider
  }
  
  public func getReviewsForProduct(id: String) async -> [ProductReview] {
    let reviews = try? await provider.fetchReviews(id)

    return reviews ?? []
  }
}
