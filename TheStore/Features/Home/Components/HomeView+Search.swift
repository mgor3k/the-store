//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

extension HomeView {
  struct SearchView: View {
    @Binding var searchPhrase: String

    var body: some View {
      HStack {
        SearchBar(
          text: $searchPhrase
        )

        FiltersButton()
      }
      .fixedSize(horizontal: false, vertical: true)
    }
  }
}

#Preview {
  HomeView.SearchView(
    searchPhrase: .constant("")
  )
}
