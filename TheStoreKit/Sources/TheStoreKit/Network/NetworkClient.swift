//  Created by Maciej Gorecki on 17/09/2023.

import Foundation

public struct NetworkClient {
  enum HTTPMethod: String {
    case get
    case put
    case post
  }

  enum Endpoint {
    case products
    case like(id: String)
    case dislike(id: String)
    case cart
    case updateCart(id: String, quantity: Int)

    var path: String {
      switch self {
      case .products:
        return "/products/"
      case .like(let id):
        return "/products/\(id)/like"
      case .dislike(let id):
        return "/products/\(id)/dislike"
      case .cart:
        return "/cart/"
      case .updateCart(let id, _):
        return "/cart/\(id)"
      }
    }

    var query: [URLQueryItem] {
      switch self {
      case .updateCart(_, let quantity):
        return [
          .init(name: "quantity", value: String(quantity))
        ]
      default:
        return []
      }
    }
  }

  let session: URLSession

  func data<T: Decodable>(for endpoint: Endpoint, method: HTTPMethod = .get) async throws -> T {
    let data = try await data(for: endpoint, method: method)
    return try JSONDecoder().decode(T.self, from: data)
  }

  func request(for endpoint: Endpoint, method: HTTPMethod = .get) async throws {
      _ = try await data(for: endpoint, method: method)
  }

  private func data(for endpoint: Endpoint, method: HTTPMethod) async throws -> Data {
    let baseURL = "http://127.0.0.1:8080"

    var url = URL(string: baseURL + endpoint.path)!
    url.append(queryItems: endpoint.query)

    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue.uppercased()

    let (data, _) = try await session.data(for: request)

    return data
  }
}

public extension NetworkClient {
  static var live: Self {
    .init(
      session: .shared
    )
  }
}
