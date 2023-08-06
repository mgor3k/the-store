//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct HomeView: View {
  @State var searchPhrase = ""
  @State var selectedCategory: Category = .all
  @EnvironmentObject var store: ProductStore

  let categories = Category.allCases

  var body: some View {
    ScrollView {
      VStack(spacing: 24) {
        Group {
          HeaderView()
          SearchView(
            searchPhrase: $searchPhrase
          )
        }
        .padding(.horizontal, 24)

        LazyVStack(spacing: 24, pinnedViews: [.sectionHeaders]) {
          Section {
            ForEach(store.products) { product in
              HomeProduct(product: product)
                .padding(.horizontal, 24)
                .padding(.top, store.isFirst(product) ? -8 : 0)
                .padding(.bottom, store.isLast(product) ? 24 : 0)
            }
          } header: {
            categoriesMenu
          }
        }
      }
    }
    .padding(.vertical)
  }

  var categoriesMenu: some View {
    HorizontalScrollMenu(
      items: categories,
      title: \.title,
      selectedItem: $selectedCategory
    )
    .frame(height: 32)
    .padding(.bottom, 8)
    .background(Color.white)
  }
}

#Preview {
  HomeView()
    .environmentObject(ProductStore())
}
