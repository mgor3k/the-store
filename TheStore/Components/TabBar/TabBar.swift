//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct TabBar: View {
  @Namespace var namespace
  @EnvironmentObject var cart: CartStore

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
          .overlay(alignment: .topTrailing) {
            if tab == .cart && cart.items.count > 0 {
              badge
            }
          }
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

  var badge: some View {
    Text(String(cart.items.count))
      .padding(6)
      .font(.caption2)
      .foregroundStyle(.white)
      .background(Color.red)
      .clipShape(Circle())
  }
}

#Preview {
  TabBar(
    selectedTab: .constant(.home)
  )
  .environmentObject(
    CartStore(
      items: [.mock[0]: 1]
    )
  )
}
