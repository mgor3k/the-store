//  Created by Maciej Gorecki on 10/08/2023.

import SwiftUI

struct DetailsView: View {
  @State private var hasAppeared = false

  let namespace: Namespace.ID

  let product: Product

  let onBackTapped: () -> Void

  var body: some View {
    ZStack {
      Color.white.ignoresSafeArea()

      VStack {
        DynamicImage(
          imageType: product.image
        )
        .matchedGeometryEffect(
          id: "image+\(product.id)",
          in: namespace
        )
        .padding()
        .background(
          Color(hex: product.hexColor)
            .opacity(0.5)
            .clipShape(
              RoundedRectangle(
                cornerRadius: 28,
                style: .continuous
              )
            )
            .matchedGeometryEffect(
              id: "background+\(product.id)",
              in: namespace
            )
        )
        .overlay(alignment: .topLeading) {
          ZStack {
            if hasAppeared {
              Button(action: onBackTapped) {
                Image(systemName: "arrow.left")
                  .foregroundStyle(.black)
                  .padding(24)
              }
              .transition(.scale)
            }
          }
          .animation(.snappy.delay(0.3), value: hasAppeared)
        }
        .padding()

        Spacer()
      }
    }
    .onAppear {
      hasAppeared = true
    }
  }
}

#Preview {
  @Namespace var namespace

  return DetailsView(
    namespace: namespace,
    product: Product.mock[0], 
    onBackTapped: {}
  )
}
