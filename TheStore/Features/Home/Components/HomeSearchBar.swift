//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct HomeSearchBar: View {
  @Binding var searchPhrase: String

  var body: some View {
    HStack {
      SearchBar(
        text: $searchPhrase
      )
    }
  }
}

#Preview {
  HomeSearchBar(
    searchPhrase: .constant("")
  )
}
