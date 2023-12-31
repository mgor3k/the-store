//  Created by Maciej Gorecki on 10/08/2023.

import SwiftUI
import TheStoreKit

struct DetailsView: View {
  @State private var hasAppeared = false

  @State var selectedSize: Int?
  @EnvironmentObject var cart: CartStore

  let namespace: Namespace.ID

  let product: Product

  let onBackTapped: () -> Void

  let numberFormatter: NumberFormatter = .currency

  var body: some View {
    ZStack {
      Color.white.ignoresSafeArea()

      VStack(alignment: .leading) {
        DynamicImage(
          imageType: product.image
        )
        .frame(
          maxWidth: .infinity,
          maxHeight: 250
        )
        .matchedGeometryEffect(
          id: MatchedGeometry.Home.image(id: product.id),
          in: namespace
        )
        .matchedGeometryEffect(
          id: MatchedGeometry.Cart.image(id: product.id),
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
              id: MatchedGeometry.Home.background(id: product.id),
              in: namespace
            )
            .matchedGeometryEffect(
              id: MatchedGeometry.Cart.background(id: product.id),
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
        .padding(.horizontal)

        if hasAppeared {
          VStack(alignment: .leading, spacing: 8) {
            Text(product.name)
              .font(.title)
              .bold()
              .pageHorizontalPadding()

            HStack(alignment: .top) {
              Text("Men's running Shoe")
                .font(.subheadline)
                .foregroundStyle(.gray)

              Spacer()

              Text(product.price.asCurrency)
                .font(.title2)
                .foregroundStyle(.orange)
                .bold()
            }
            .padding(.bottom, 18)
            .pageHorizontalPadding()

            Text("Select Size")
              .font(.subheadline)
              .pageHorizontalPadding()

            HorizontalScrollMenu(
              items: Array(product.availableSizes),
              title: \.stringValue,
              selectedItem: $selectedSize
            )
            .frame(height: 50)
            .padding(.bottom, 12)

            Text("Description")
              .pageHorizontalPadding()
              .padding(.bottom, 12)

            Text("Your workhorse with wings returns. The Nike Air Zoom Pegasus 18 continues...")
              .pageHorizontalPadding()
              .foregroundStyle(.gray)
              .font(.caption)
              .multilineTextAlignment(.leading)
              .lineSpacing(6)
              .fixedSize(horizontal: false, vertical: true)
              .padding(.bottom, 24)

            ReviewSection(
              productId: product.id
            )
            .pageHorizontalPadding()
          }
          .padding(.vertical)
          .transition(.slide)
        }

        Spacer()
      }
      .padding(.vertical)
      .overlay(alignment: .bottomTrailing) {
        ZStack {
          if hasAppeared {
            BasketView {
              cart.add(product)
              onBackTapped()
            }
          }
        }
        .animation(.snappy.delay(0.5), value: hasAppeared)
      }
    }
    .onAppear {
      selectedSize = product.availableSizes.first

      hasAppeared = true
    }
  }
}

private extension Int {
  var stringValue: String {
    String(self)
  }
}

#Preview {
  @Namespace var namespace

  return DetailsView(
    namespace: namespace,
    product: Product.mock[0],
    onBackTapped: {}
  )
  .environmentObject(CartStore())
}
