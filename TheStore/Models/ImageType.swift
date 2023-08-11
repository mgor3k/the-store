//  Created by Maciej Gorecki on 06/08/2023.

import Foundation

enum ImageType: Equatable {
  case local(String)
  case remote(URL)
}