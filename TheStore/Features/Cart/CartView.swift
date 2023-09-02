//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct CartView: View {
  var body: some View {
    VStack {
      Text("Cart")
        .font(.title)
        .bold()
        .frame(maxWidth: .infinity, alignment: .leading)

      Spacer()
    }
    .padding(.vertical)
    .pageHorizontalPadding()
  }
}

#Preview {
  CartView()
}
