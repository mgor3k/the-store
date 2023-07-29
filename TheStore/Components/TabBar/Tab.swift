//  Created by Maciej Gorecki on 29/07/2023.

import Foundation

enum Tab: String, Identifiable, CaseIterable {
  case home, cart, favorite, profile

  var id: String {
    rawValue
  }
}
