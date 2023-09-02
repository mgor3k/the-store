//  Created by Maciej Gorecki on 10/08/2023.

import SwiftUI
import TheStoreKit

struct DetailsView: View {
  @State private var hasAppeared = false
  @State private var reviews: [ProductReview] = []

  @State var selectedSize: Size?
  @EnvironmentObject var cart: CartStore

  let namespace: Namespace.ID

  let product: Product

  let onBackTapped: () -> Void

  static let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()

    formatter.numberStyle = .currency
    formatter.currencyCode = "US"
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 0

    return formatter
  }()

  var formattedPrice: String? {
    Self.numberFormatter.string(from: NSNumber(value: product.price))
  }

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
          id: MatchedGeometry.image(id: product.id),
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
              id: MatchedGeometry.background(id: product.id),
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
              .padding(.horizontal, 24)

            HStack(alignment: .top) {
              Text("Men's running Shoe")
                .font(.subheadline)
                .foregroundStyle(.gray)

              Spacer()

              if let formattedPrice {
                Text(formattedPrice)
                  .font(.title2)
                  .foregroundStyle(.orange)
                  .bold()
              }
            }
            .padding(.bottom, 18)
            .padding(.horizontal, 24)

            Text("Select Size")
              .font(.subheadline)
              .padding(.horizontal, 24)

            HorizontalScrollMenu(
              items: product.availableSizes,
              title: \.title,
              selectedItem: $selectedSize
            )
            .frame(height: 50)
            .padding(.bottom, 12)

            Text("Description")
              .padding(.horizontal, 24)
              .padding(.bottom, 12)

            Text("Your workhorse with wings returns. The Nike Air Zoom Pegasus 18 continues...")
              .padding(.horizontal, 24)
              .foregroundStyle(.gray)
              .font(.caption)
              .multilineTextAlignment(.leading)
              .lineSpacing(6)
              .fixedSize(horizontal: false, vertical: true)
              .padding(.bottom, 24)

            ReviewSection(
              productId: product.id
            )
            .padding(.horizontal, 24)
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

#Preview {
  @Namespace var namespace

  return DetailsView(
    namespace: namespace,
    product: Product.mock[0],
    onBackTapped: {}
  )
  .environmentObject(CartStore())
}
