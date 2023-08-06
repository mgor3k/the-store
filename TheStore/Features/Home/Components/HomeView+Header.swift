//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

extension HomeView {
  struct HeaderView: View {
    var body: some View {
      VStack(alignment: .leading, spacing: 8) {
        Text("Nike Collections")
          .font(.title)
          .bold()

        Text("The best of Nike, all in one place.")
          .font(.subheadline)
          .foregroundStyle(.gray)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}

#Preview {
  HomeView.HeaderView()
}
