//  Created by Maciej Gorecki on 05/08/2023.

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.footnote)
      .bold()
      .foregroundStyle(.white)
      .padding(.vertical, 6)
      .padding(.horizontal, 16)
      .background(Color.secondaryAccent)
      .clipShape(Capsule())
  }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
  static var primary: Self {
    return .init()
  }
}

#Preview {
  Button(action: {}) {
    Text("Test")
  }
  .buttonStyle(.primary)
}
