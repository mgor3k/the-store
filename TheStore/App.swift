//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI
import TheStoreKit

@main
struct TheStoreApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
        .tint(.orange)
        .environmentObject(ProductStore())
        .environmentObject(CartStore())
        .environmentObject(ReviewStore())
    }
  }
}
