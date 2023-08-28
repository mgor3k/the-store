//  Created by Maciej Gorecki on 31/07/2023.

import SwiftUI

struct HorizontalScrollMenu<T: Hashable>: View {
  @Namespace private var namespace

  let items: [T]
  let title: KeyPath<T, String>

  @Binding var selectedItem: T?

  var body: some View {
    ScrollViewReader { reader in
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack {
          ForEach(items, id: title) { item in
            Text(item[keyPath: title])
              .font(.footnote)
              .foregroundStyle(selectedItem == item ? .white : .gray)
              .padding(.vertical, 8)
              .padding(.horizontal, 16)
              .background(
                selectedItem == item
                ? Color.orange
                  .clipShape(
                    RoundedRectangle(
                      cornerRadius: 20,
                      style: .continuous
                    )
                  )
                  .matchedGeometryEffect(id: "item", in: namespace)
                : nil
              )
              .id(item)
              .animation(
                .snappy(duration: 0.3),
                value: selectedItem
              )
              .onTapGesture {
                selectedItem = item

                withAnimation {
                  reader.scrollTo(item, anchor: .center)
                }
              }
          }
        }
        .padding(.horizontal, 24)
      }
    }
  }
}

#Preview {
  HorizontalScrollMenu<String>(
    items: ["first", "second", "third", "forth"],
    title: \.self,
    selectedItem: .constant("first")
  )
}
