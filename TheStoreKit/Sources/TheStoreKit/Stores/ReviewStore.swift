//  Created by Maciej Gorecki on 02/09/2023.

import Foundation

public final class ReviewStore: ObservableObject {
  public init() {
    // TODO: Provider
  }
  
  public func getReviewsForProduct(id: String) async -> [ProductReview] {
    ProductReview.mock
  }
}
