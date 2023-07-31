//  Created by Maciej Gorecki on 31/07/2023.

import Foundation

enum Category: Hashable, CaseIterable {
  case all, shoes, bag, clothing, cap, pants

  var title: String {
    switch self {
    case .all:
      "All"
    case .shoes:
      "Shoes"
    case .bag:
      "Bag"
    case .clothing:
      "Clothing"
    case .cap:
      "Cap"
    case .pants:
      "Pants"
    }
  }
}
