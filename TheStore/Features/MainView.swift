//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct MainView: View {
  @Namespace var namespace

  @State var selectedTab: Tab = .home
  @State var selectedProduct: Product?

  var body: some View {
    TabView(selection: $selectedTab) {
      HomeView(
        namespace: namespace,
        selectedProduct: $selectedProduct
      )
      .tag(Tab.home)

      CartView()
        .tag(Tab.cart)

      FavoriteView()
        .tag(Tab.favorite)

      ProfileView()
        .tag(Tab.profile)
    }
    .overlay {
      TabBar(selectedTab: $selectedTab)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .bottom
        )
        .ignoresSafeArea(.keyboard)
    }
    .overlay {
      if let selectedProduct {
        DetailsView(
          namespace: namespace,
          product: selectedProduct,
          onBackTapped: {
            self.selectedProduct = nil
          }
        )
      }
    }
    .animation(
      .snappy.speed(1.35),
      value: selectedProduct
    )
  }
}

#Preview {
  MainView()
}
