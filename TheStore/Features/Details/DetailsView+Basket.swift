//  Created by Maciej Gorecki on 22/08/2023.

import SwiftUI

extension DetailsView {
  struct BasketView: View {
    let action: () -> Void

    var body: some View {
      Button(action: action) {
        Image(systemName: "basket.fill")
          .foregroundStyle(.white)
          .padding(14)
          .background(Color.orange)
          .clipShape(Circle())
          .padding(24)
          .shadow(
            color: .orange.opacity(0.3),
            radius: 10,
            x: 2,
            y: 8
          )
      }
      .transition(.scale)
    }
  }
}

#Preview {
  DetailsView.BasketView(
    action: {}
  )
}
