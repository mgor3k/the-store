//  Created by Maciej Gorecki on 22/08/2023.

import Foundation

struct Size: Hashable, ExpressibleByIntegerLiteral {
  let value: Int

  var title: String {
    String(value)
  }

  init(integerLiteral value: Int) {
    self.value = value
  }
}
