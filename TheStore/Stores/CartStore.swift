//  Created by Maciej Gorecki on 19/08/2023.

import Foundation

final class CartStore: ObservableObject {
  @Published var items: [Product: Int] = [:]

  init(items: [Product: Int] = [:]) {
    self.items = items
  }

  func add(_ product: Product) {
    guard let count = items[product] else {
      items[product] = 1
      return
    }

    items[product] = count + 1
  }
}
