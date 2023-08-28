//  Created by Maciej Gorecki on 19/08/2023.

import Foundation

public final class CartStore: ObservableObject {
  @Published public var items: [Product: Int] = [:]

  public init(items: [Product: Int] = [:]) {
    self.items = items
  }

  public func add(_ product: Product) {
    guard let count = items[product] else {
      items[product] = 1
      return
    }

    items[product] = count + 1
  }
}
