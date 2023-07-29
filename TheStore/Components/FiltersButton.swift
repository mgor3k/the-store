//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct FiltersButton: View {
  var body: some View {
    Image(systemName: "line.3.horizontal")
      .padding()
      .frame(maxHeight: .infinity)
      .background(
        Color.gray.opacity(0.1)
          .clipShape(
            RoundedRectangle(
              cornerRadius: 18,
              style: .continuous
            )
          )
      )
  }
}

#Preview {
  FiltersButton()
}
