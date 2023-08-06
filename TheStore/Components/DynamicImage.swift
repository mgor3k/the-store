//  Created by Maciej Gorecki on 06/08/2023.

import SwiftUI

struct DynamicImage: View {
  let imageType: ImageType

  var body: some View {
    switch imageType {
    case .local(let name):
      Image(name)
        .resizable()
        .scaledToFit()
    case .remote(let url):
      AsyncImage(url: url)
        .scaledToFit()
    }
  }
}

#Preview {
  DynamicImage(
    imageType: .local("nike1")
  )
}
