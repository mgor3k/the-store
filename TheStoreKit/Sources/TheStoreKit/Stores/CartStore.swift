//  Created by Maciej Gorecki on 19/08/2023.

import Foundation

public final class CartStore: ObservableObject {
  private let provider: CartProvider

  @Published public var items: [Product: Int] = [:]

  public var summary: CartSummary {
    let taxRate = 0.19

    let itemsSum = items
      .map { $0.price * Double($1) }
      .reduce(0, +)

    let tax = itemsSum * taxRate
    let sumWithoutTax = itemsSum - tax
    let shipping = items.keys.count > 0 ? 19.99 : 0

    return .init(
      subtotal: sumWithoutTax,
      tax: tax,
      shipping: shipping
    )
  }

  public init(provider: CartProvider = .inMemory) {
    self.provider = provider
  }

  public func loadCart() {
    Task {
      do {
        items = try await provider.fetchCart()
      } catch {
        // Do nothing
      }
    }
  }

  public func add(_ product: Product) {
    guard let count = items[product] else {
      items[product] = 1
      return
    }

    items[product] = count + 1
  }

  public func quantity(for product: Product) -> Int {
    items[product] ?? 0
  }

  public func incrementQuantity(for product: Product) {
    guard let count = items[product] else { return }

    items[product] = count + 1
  }

  public func decrementQuantity(for product: Product) {
    guard let count = items[product] else { return }

    let newCount = count - 1

    items[product] = newCount == 0 ? nil : newCount
  }

  public func checkout() async {
    // TODO: Temp
    await MainActor.run {
      items = [:]
    }
  }
}
