//  Created by Maciej Gorecki on 29/08/2023.

import Foundation

enum MatchedGeometry {
  enum Home {
    static func image(id: String) -> String {
      "image+home+\(id)"
    }

    static func background(id: String) -> String {
      "background+home+\(id)"
    }
  }

  enum Cart {
    static func image(id: String) -> String {
      "image+cart+\(id)"
    }

    static func background(id: String) -> String {
      "background+cart+\(id)"
    }
  }
}
