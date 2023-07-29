//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct HomeSearchBar: View {
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

#Preview {
  HomeSearchBar(
    searchPhrase: .constant("")
  )
}
