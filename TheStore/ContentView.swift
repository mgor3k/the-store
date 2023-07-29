//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)

      Text("Hello, world!")
      
      TabBar()
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .bottom
        )
    }
  }
}

#Preview {
  ContentView()
}
