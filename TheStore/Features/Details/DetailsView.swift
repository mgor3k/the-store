//  Created by Maciej Gorecki on 10/08/2023.

import SwiftUI

struct DetailsView: View {
  @State private var hasAppeared = false

  // TODO: Temporary
  let sizes: [Size] = [
    36, 37, 38, 39, 40, 41, 42, 43, 44, 45
  ]

  @State var selectedSize: Size = 37
  @EnvironmentObject var cart: CartStore

  let namespace: Namespace.ID

  let product: Product

  let onBackTapped: () -> Void

  var body: some View {
    ZStack {
      Color.white.ignoresSafeArea()

      VStack(alignment: .leading) {
        DynamicImage(
          imageType: product.image
        )
        .frame(maxWidth: .infinity, maxHeight: 250)
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

              Text("$180")
                .font(.title2)
                .foregroundStyle(.orange)
                .bold()
            }
            .padding(.bottom, 18)
            .padding(.horizontal, 24)

            Text("Select Size")
              .font(.subheadline)
              .padding(.horizontal, 24)

            // Adjust this to match design
            HorizontalScrollMenu(
              items: sizes,
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

            Text("Reviews")
              .padding(.horizontal, 24)

            HStack {
              ForEach(0...4, id: \.self) { index in
                AsyncImage(url: URL(string: "https://i.pravatar.cc/300"), transaction: Transaction(animation: .snappy)) { phase in
                  switch phase {
                  case .empty:
                    EmptyView()
                  case .success(let image):
                    image
                      .resizable()
                      .scaledToFill()
                      .frame(height: 40)
                      .clipShape(Circle())
                      .padding(2)
                      .background(Circle().stroke(.white, lineWidth: 2))
                      .transition(.scale)
                  case .failure:
                    EmptyView()
                  @unknown default:
                    EmptyView()
                  }
                }
                .frame(width: 40, height: 40)
                .offset(x: CGFloat(index * -14))
              }

              Spacer()
            }
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
