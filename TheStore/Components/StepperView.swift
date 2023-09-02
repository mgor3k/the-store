//  Created by Maciej Gorecki on 02/09/2023.

import SwiftUI

struct StepperView: View {
  let value: Int

  let onIncrement: () -> Void
  let onDecrement: () -> Void

  var body: some View {
    HStack(spacing: 14) {
      Button(action: onDecrement) {
        Image(systemName: "chevron.left")
          .font(.caption2)
          .bold()
      }

      Text(value, format: .number)
        .font(.caption)
        .fontDesign(.monospaced)
        .contentTransition(.numericText())
        .animation(.snappy, value: value)

      Button(action: onIncrement) {
        Image(systemName: "chevron.right")
          .font(.caption2)
          .bold()
      }
    }
    .foregroundStyle(.black)
    .padding(.vertical, 6)
    .padding(.horizontal, 12)
    .overlay {
      RoundedRectangle(cornerRadius: 16)
        .stroke(.gray.opacity(0.1), lineWidth: 1)
    }
  }
}

#Preview {
  @State var value = 0

  return StepperView(
    value: value,
    onIncrement: { value += 1 },
    onDecrement: { value -= 1 }
  )
}
