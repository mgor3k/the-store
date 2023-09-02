//  Created by Maciej Gorecki on 02/09/2023.

import SwiftUI

struct StepperView: View {
  @State var quantity = 0

  var body: some View {
    HStack(spacing: 14) {
      Button(action: decrement) {
        Image(systemName: "chevron.left")
          .font(.caption)
          .bold()
      }

      Text(quantity, format: .number)
        .font(.callout)
        .fontDesign(.monospaced)
        .contentTransition(.numericText())
        .animation(.snappy, value: quantity)

      Button(action: increment) {
        Image(systemName: "chevron.right")
          .font(.caption)
          .bold()
      }
    }
    .foregroundStyle(.black)
    .padding(.vertical, 8)
    .padding(.horizontal, 14)
    .overlay {
      RoundedRectangle(cornerRadius: 16)
        .stroke(.gray.opacity(0.1), lineWidth: 1)
    }
  }

  private func increment() {
    quantity += 1
  }

  private func decrement() {
    quantity -= 1
  }
}

#Preview {
  StepperView()
}
