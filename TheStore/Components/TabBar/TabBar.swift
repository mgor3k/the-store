//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct TabBar: View {
  var tabs = Tab.allCases

  var body: some View {
    HStack {
      ForEach(tabs) { tab in
        Text(tab.rawValue)
      }
    }
  }
}

#Preview {
  TabBar()
}
