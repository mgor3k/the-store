//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct SearchBar: View {
  @FocusState private var isFocused: Bool

  @Binding var text: String

  var body: some View {
    HStack(spacing: 12) {
      Image(systemName: "magnifyingglass")
        .font(.title3)

      TextField("Search", text: $text)
        .focused($isFocused)
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 14)
    .background(
      Color.gray.opacity(0.1)
    )
    .clipShape(
      RoundedRectangle(cornerRadius: 18, style: .continuous)
    )
    .onTapGesture {
      if !isFocused {
        isFocused = true
      }
    }
  }
}

#Preview {
  SearchBar(
    text: .constant("")
  )
  .padding()
}
