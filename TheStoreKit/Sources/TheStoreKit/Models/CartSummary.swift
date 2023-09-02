//  Created by Maciej Gorecki on 02/09/2023.

import Foundation

public struct CartSummary: Equatable {
  public let subtotal: Double
  public let tax: Double
  public let shipping: Double

  public var total: Double {
    subtotal + tax + shipping
  }
}
