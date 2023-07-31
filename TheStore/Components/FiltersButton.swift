//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct FiltersButton: View {
  var body: some View {
    VStack {
      HStack(spacing: 2) {
        Rectangle()
          .foregroundStyle(.orange)
          .frame(width: 4)
          .clipShape(Capsule())
        Rectangle()
          .foregroundStyle(.orange)
          .frame(width: 10)
          .clipShape(Capsule())
      }
      .frame(height: 3)

      HStack(spacing: 2) {
        Rectangle()
          .foregroundStyle(.gray)
          .frame(width: 10)
          .clipShape(Capsule())

        Rectangle()
          .foregroundStyle(.gray)
          .frame(width: 4)
          .clipShape(Capsule())
      }
      .frame(height: 3)
    }
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
    .frame(height: 44)
}
