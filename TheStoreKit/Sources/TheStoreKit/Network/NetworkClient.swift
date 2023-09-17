//  Created by Maciej Gorecki on 17/09/2023.

import Foundation

public struct NetworkClient {
  enum HTTPMethod: String {
    case get
    case put
  }

  enum Endpoint {
    case products
    case like(id: String)
    case dislike(id: String)

    var path: String {
      switch self {
      case .products:
        return "/products/"
      case .like(let id):
        return "/products/\(id)/like"
      case .dislike(let id):
        return "/products/\(id)/dislike"
      }
    }
  }

  let session: URLSession

  func data<T: Decodable>(for endpoint: Endpoint, method: HTTPMethod = .get) async throws -> T {
    let baseURL = "http://127.0.0.1:8080"

    let url = URL(string: baseURL + endpoint.path)!
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue.uppercased()

    let (data, _) = try await session.data(for: request)
    let decoded = try JSONDecoder().decode(T.self, from: data)

    return decoded
  }
}

public extension NetworkClient {
  static var live: Self {
    .init(
      session: .shared
    )
  }
}
