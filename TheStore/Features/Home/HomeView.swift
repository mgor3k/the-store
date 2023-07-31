//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct HomeView: View {
  @State var searchPhrase = ""
  @State var selectedCategory: Category = .all

  let categories = Category.allCases

  var body: some View {
    VStack(spacing: 28) {
      Group {
        HomeHeader()
        HomeSearchBar(
          searchPhrase: $searchPhrase
        )
      }
      .padding(.horizontal, 24)

      HorizontalScrollMenu(
        items: categories,
        title: \.title,
        selectedItem: $selectedCategory
      )
      .frame(height: 32)

      Spacer()
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
