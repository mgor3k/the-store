//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct TabBar: View {
  @Namespace var namespace
  @EnvironmentObject var cart: CartStore

  var tabs = Tab.allCases

  @Binding var selectedTab: Tab

  var isCartSelected: Bool {
    selectedTab == .cart
  }

  var hasCartItems: Bool {
    cart.items.count > 0
  }

  var body: some View {
    HStack {
      ForEach(tabs) { tab in
        Image(systemName: tab.systemImageName)
          .foregroundStyle(
            selectedTab == tab ? .white : .gray
          )
          .opacity(
            tab == .cart && hasCartItems && isCartSelected ? 0 : 1
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
          .overlay(alignment: selectedTab == .cart ? .center : .topTrailing) {
            if tab == .cart && hasCartItems {
              badge
            }
          }
          .animation(
            .snappy(duration: 0.3),
            value: selectedTab
          )
          .animation(
            .snappy,
            value: cart.items.count
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

  @ViewBuilder
  var badge: some View {
    Text(String(cart.items.count))
      .padding(6)
      .font(isCartSelected ? .caption : .caption2)
      .bold(isCartSelected)
      .foregroundStyle(.white)
      .background(isCartSelected ? nil : Color.red)
      .clipShape(Circle())
      .transition(.scale)
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
