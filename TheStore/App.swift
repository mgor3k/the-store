//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI
import TheStoreKit

@main
struct TheStoreApp: App {
  let productStore: ProductStore
  let cartStore: CartStore
  let reviewStore: ReviewStore

  let notificationManager = NotificationManager()

  init() {
    productStore = ProductStore(
      provider: .inMemory
    )

    cartStore = CartStore(
      provider: .inMemory
    )

    reviewStore = ReviewStore(
      provider: .inMemory
    )

    loadInitialData()
  }

  var body: some Scene {
    WindowGroup {
      MainView()
        .tint(.orange)
        .environmentObject(productStore)
        .environmentObject(cartStore)
        .environmentObject(reviewStore)
        .environmentObject(notificationManager)
    }
  }

  private func loadInitialData() {
    Task {
      do {
        // Make it parallel
        try await productStore.loadProducts()
        try await cartStore.loadCart()
      } catch {
        //
      }
    }
  }
}
