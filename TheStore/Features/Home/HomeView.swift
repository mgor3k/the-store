//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct HomeView: View {
  @State var searchPhrase = ""
  @State var selectedCategory: Category = .all
  @State var products: [Product] = Product.mock

  let categories = Category.allCases

  var body: some View {
    ScrollView {
      LazyVStack(spacing: 24, pinnedViews: [.sectionHeaders]) {
        Group {
          Header()
          SearchView(
            searchPhrase: $searchPhrase
          )
        }
        .padding(.horizontal, 24)

        Section {
          ForEach(products) { product in
            HomeProduct(product: product)
              .padding(.horizontal, 24)
              .padding(.top, isFirst(product) ? -8 : 0)
              .padding(.bottom, isLast(product) ? 24 : 0)
          }
        } header: {
          categoriesMenu
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

  func isFirst(_ product: Product) -> Bool {
    (products.firstIndex(where: { $0.id == product.id }) ?? 0) == 0
  }

  func isLast(_ product: Product) -> Bool {
    (products.firstIndex(where: { $0.id == product.id }) ?? 0) == products.count - 1
  }
}

#Preview {
  HomeView()
}
