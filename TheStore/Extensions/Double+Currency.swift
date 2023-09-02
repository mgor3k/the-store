//  Created by Maciej Gorecki on 02/09/2023.

import Foundation

extension Double {
  var asCurrency: String {
    NumberFormatter.currency.string(from: NSNumber(value: self)) ?? "error"
  }
}
