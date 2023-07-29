//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct HomeView: View {
  @State var searchPhrase = ""

  var body: some View {
    VStack(spacing: 32) {
      Group {
        HomeHeader()
        HomeSearchBar(
          searchPhrase: $searchPhrase
        )
      }
      .padding(.horizontal, 24)
    }
    .frame(
      maxWidth: .infinity,
      maxHeight: .infinity,
      alignment: .top
    )
    .padding(.vertical)
  }
}

#Preview {
  HomeView()
}
