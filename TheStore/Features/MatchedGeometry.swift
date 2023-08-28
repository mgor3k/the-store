//  Created by Maciej Gorecki on 29/08/2023.

import Foundation

enum MatchedGeometry {
  static func image(id: String) -> String {
    "image+\(id)"
  }

  static func background(id: String) -> String {
    "background+\(id)"
  }
}
