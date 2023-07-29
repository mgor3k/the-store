//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct TabBar: View {
  @Namespace var namespace

  var tabs = Tab.allCases

  @Binding var selectedTab: Tab

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
          .frame(maxWidth: .infinity)
          .contentShape(Circle())
          .onTapGesture {
            selectedTab = tab
          }
      }
    }
    .padding()
    .background(Color.white)
  }
}

#Preview {
  TabBar(
    selectedTab: .constant(.home)
  )
}
