//  Created by Maciej Gorecki on 02/09/2023.

import SwiftUI
import TheStoreKit

extension DetailsView {
  struct ReviewSection: View {
    @EnvironmentObject var review: ReviewStore

    @State var reviews: [ProductReview] = []

    let productId: String

    var body: some View {
      VStack(alignment: .leading) {
        if !reviews.isEmpty {
          Text("Reviews")
        }

        HStack {
          ForEach(Array(zip(reviews.indices, reviews)), id: \.0) { (index, review) in
            AsyncImage(url: review.avatarURL, transaction: Transaction(animation: .snappy)) { phase in
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
      }
      .task {
        reviews = await review.getReviewsForProduct(id: productId)
      }
    }
  }
}

#Preview {
  DetailsView.ReviewSection(
    productId: "test"
  )
}
