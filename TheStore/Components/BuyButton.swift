//  Created by Maciej Gorecki on 22/08/2023.

import SwiftUI

struct BuyButton: View {
  @State var isAnimating = false

  let action: () -> Void

  var body: some View {
    Button(action: onAction) {
      ZStack {
        Text("Buy")
          .opacity(isAnimating ? 0 : 1)

        if isAnimating {
          Text("✓")
            .fontWeight(.heavy)
            .zIndex(1)
            .transition(.scale)
        }
      }
    }
    .buttonStyle(.primary)
    .animation(.snappy, value: isAnimating)
  }

  func onAction() {
    isAnimating = true
    action()

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      isAnimating = false
    }
  }
}

#Preview {
  BuyButton(
    action: {}
  )
}
