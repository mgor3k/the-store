//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct HomeView: View {
  @State var selectedTab: Tab = .home

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)

      Text("Hello, world!")
      
      TabBar(selectedTab: $selectedTab)
        .padding(.bottom)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .bottom
        )
    }
  }
}

#Preview {
  HomeView()
}
