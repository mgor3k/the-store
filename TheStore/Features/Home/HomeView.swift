//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct HomeView: View {
  @State var searchPhrase = ""
  @State var selectedCategory: Category = .all
  @EnvironmentObject var store: ProductStore

  let categories = Category.allCases

  let namespace: Namespace.ID
  @Binding var selectedProduct: Product?

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
            ForEach(products(for: selectedCategory)) { product in
              HomeProduct(
                namespace: namespace,
                product: product,
                onBuyTapped: {
                  // TODO:
                }
              )
              .onTapGesture {
                selectedProduct = product
              }
              .padding(.horizontal, 24)
              .padding(.top, store.isFirst(product) ? -8 : 0)
              .padding(.bottom, store.isLast(product) ? 24 : 0)
            }
          } header: {
            categoriesMenu
          }
        }
      }
      .animation(.snappy, value: selectedCategory)
    }
    .padding(.vertical)
  }

  func products(for category: Category) -> [Product] {
    // TODO: Temp
    switch category {
    case .shoes:
      return [store.products[0], store.products[3]]
    default:
      return store.products
    }
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
  @Namespace var namespace

  return HomeView(
    namespace: namespace,
    selectedProduct: .constant(nil)
  )
  .environmentObject(ProductStore())
}
