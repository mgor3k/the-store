//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct HomeView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)

      Text("Hello, world!")
      
      TabBar()
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
