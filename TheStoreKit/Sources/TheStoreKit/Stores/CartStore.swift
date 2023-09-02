//  Created by Maciej Gorecki on 19/08/2023.

import Foundation

public final class CartStore: ObservableObject {
  @Published public var items: [Product: Int] = [:]

  public var summary: CartSummary {
    let taxRate = 0.19

    let itemsSum = items
      .map { $0.price * Double($1) }
      .reduce(0, +)

    let tax = itemsSum * taxRate
    let sumWithoutTax = itemsSum - tax
    let shipping = 19.99

    return .init(
      subtotal: sumWithoutTax,
      tax: tax,
      shipping: shipping
    )
  }

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
