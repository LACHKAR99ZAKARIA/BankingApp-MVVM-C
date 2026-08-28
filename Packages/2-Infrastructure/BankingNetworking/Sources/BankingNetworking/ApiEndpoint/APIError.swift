//
//  APIError.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import Foundation

enum APIError: Error, Hashable, Identifiable {

    case defaultError
    case api(ErrorResponse)
    case custom(message: String)

    var id: Self { self }

    var code: Int {
        switch self {
        case .api(let response):
            return response.code ?? 0

        default:
            return 0
        }
    }

    var title: String? {
        switch self {
        default:
            return nil
        }
    }

    var message: String {
        switch self {

        case .api(let response):
            return response.message.isEmpty
                ? "Une erreur est survenue."
                : response.message.joined(separator: "\n")

        case .custom(let message):
            return message

        case .defaultError:
            return "Une erreur est survenue."
        }
    }
}

struct ErrorResponse: Codable, Hashable {
    let code: Int?
    let message: [String]
}
