//  Created by Maciej Gorecki on 02/09/2023.

import OSLog
import Foundation

public final class ReviewStore: ObservableObject {
  private let provider: ReviewProvider

  public init(provider: ReviewProvider = .inMemory) {
    self.provider = provider
  }
  
  public func getReviewsForProduct(id: String) async -> [ProductReview] {
    Logger.reviewStore.info("Fetching reviews")
    do {
      let reviews = try await provider.fetchReviews(id)

      return reviews
    } catch {
      Logger.reviewStore.error("\(error.localizedDescription)")
      return []
    }
  }
}

extension Logger {
  static let reviewStore = Logger(subsystem: subsystem, category: "ReviewStore")
}
