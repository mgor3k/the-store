//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct HomeView: View {
  var body: some View {
    VStack {
      HomeHeader()
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
