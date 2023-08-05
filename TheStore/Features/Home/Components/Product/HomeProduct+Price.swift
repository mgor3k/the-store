//  Created by Maciej Gorecki on 05/08/2023.

import SwiftUI

extension HomeProduct {
  struct PriceView: View {
    var body: some View {
      HStack(alignment: .bottom, spacing: 0) {
        Text("$320.")
        Text("00")
          .font(.caption2)
          .offset(y: 3)
      }
      .bold()
    }
  }
}

#Preview {
  HomeProduct.PriceView()
}
