//
//  APIManager.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import Foundation
import BankingModels
import BankingUtilities

@MainActor
class APIManager {
    static let shared = APIManager()

    private init() {}

    func performRequest<T: Decodable>(for endpoint: APIEndpoint) async throws -> T {
        var urlComponents = URLComponents(
            url: endpoint.baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        )!
        
        if let query = endpoint.query {
            urlComponents.queryItems = query.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }

        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = endpoint.method.rawValue
        
        if let parameters = endpoint.parameters {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        if let headers = endpoint.headers {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        if let token = TokenStore.shared.token {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        print("Request URL: \(urlRequest.url?.absoluteString ?? "")")
        print("HTTP Method: \(urlRequest.httpMethod ?? "")")

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NSError(
                domain: "APIError",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Invalid response from the server."]
            )
        }

        print("HTTP Status Code: \(httpResponse.statusCode)")

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            if let date = formatter.date(from: dateString) {
                return date
            }

            formatter.formatOptions = [.withInternetDateTime]
            if let date = formatter.date(from: dateString) {
                return date
            }

            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid date format: \(dateString)"
            )
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            if let errorResponse = try? decoder.decode(ErrorResponse.self, from: data) {
                throw APIError.api(errorResponse)
            }
            throw APIError.defaultError
        }

        return try decoder.decode(APIResponse<T>.self, from: data).data
    }
}
