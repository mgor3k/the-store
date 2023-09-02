//  Created by Maciej Gorecki on 02/09/2023.

import SwiftUI

extension EnvironmentValues {
  var spacing: Spacing {
    get { self[Spacing.self] }
    set { self[Spacing.self] = newValue }
  }
}

struct Spacing: EnvironmentKey {
  var horizontal: CGFloat = 24

  static var defaultValue: Spacing {
    .init()
  }
}

extension View {
  func pageHorizontalPadding() -> some View {
    self.modifier(PageHorizontalPadding())
  }
}

struct PageHorizontalPadding: ViewModifier {
  @Environment(\.spacing) var spacing

  func body(content: Content) -> some View {
    content.padding(.horizontal, spacing.horizontal)
  }
}
