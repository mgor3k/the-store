//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct MainView: View {
  @State var selectedTab: Tab = .home

  var body: some View {
    TabView(selection: $selectedTab) {
      HomeView()
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
    .onAppear {
      UITabBar.appearance().isHidden = true
    }
  }
}

#Preview {
  MainView()
}
