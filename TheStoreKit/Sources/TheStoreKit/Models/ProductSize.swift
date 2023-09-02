//  Created by Maciej Gorecki on 22/08/2023.

import Foundation

public struct ProductSize: Hashable, ExpressibleByIntegerLiteral {
  let value: Int

  public var title: String {
    String(value)
  }

  public init(integerLiteral value: Int) {
    self.value = value
  }
}
