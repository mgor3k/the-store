//  Created by Maciej Gorecki on 05/08/2023.

import SwiftUI

extension ProductView {
  struct PriceView: View {
    let price: Double

    var intValue: Int {
      Int(price)
    }

    var fractionalIntValue: Int {
      let fraction = price - Double(intValue)
      return Int(fraction * 100)
    }

    var fractionalString: String {
      fractionalIntValue < 10 
      ? "0\(fractionalIntValue)"
      : "\(fractionalIntValue)"
    }

    var body: some View {
      HStack(alignment: .bottom, spacing: 0) {
        Text("$\(intValue).")
        Text(fractionalString)
          .font(.caption2)
          .offset(y: 3)
      }
      .bold()
    }
  }
}

#Preview {
  ProductView.PriceView(
    price: 250.50
  )
}
