//  Created by Maciej Gorecki on 02/09/2023.

import Foundation

extension NumberFormatter {
  static let currency: NumberFormatter = {
    let formatter = NumberFormatter()

    formatter.numberStyle = .currency
    formatter.currencyCode = "US"
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 0

    return formatter
  }()
}
