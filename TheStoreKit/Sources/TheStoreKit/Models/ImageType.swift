//  Created by Maciej Gorecki on 06/08/2023.

import Foundation

public enum ImageType: Equatable, Hashable, Codable {
  case local(String)
  case remote(URL)
}
