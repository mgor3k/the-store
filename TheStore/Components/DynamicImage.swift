//  Created by Maciej Gorecki on 06/08/2023.

import SwiftUI
import TheStoreKit

struct DynamicImage: View {
  let imageType: ImageType

  var body: some View {
    switch imageType {
    case .local(let name):
      Image(name)
        .resizable()
        .scaledToFit()
    case .remote(let url):
      AsyncImage(url: url) { phase in
        switch phase {
        case .empty:
          ProgressView()
            .progressViewStyle(.circular)
            .foregroundStyle(.gray)
        case .success(let image):
          image
            .resizable()
            .scaledToFit()
        case .failure:
          EmptyView()
        @unknown default:
          EmptyView()
        }
      }
    }
  }
}

#Preview {
  DynamicImage(
    imageType: .local("nike1")
  )
}
