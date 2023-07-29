//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct TabBar: View {
  @Namespace var namespace

  var tabs = Tab.allCases

  @State var selectedTab: Tab = .home

  var body: some View {
    HStack {
      ForEach(tabs) { tab in
        Image(systemName: tab.systemImageName)
          .foregroundStyle(
            selectedTab == tab ? .white : .gray
          )
          .frame(
            width: 44,
            height: 44
          )
          .background(
            selectedTab == tab
            ? Color.orange
              .clipShape(Circle())
              .matchedGeometryEffect(id: "tab", in: namespace)
            : nil
          )
          .animation(
            .snappy(duration: 0.3),
            value: selectedTab
          )
          .onTapGesture {
            selectedTab = tab
          }
          .frame(maxWidth: .infinity)
      }
    }
    .padding(.horizontal)
  }
}

#Preview {
  TabBar()
}
