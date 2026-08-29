//
//  CategoriesEndpoint.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation
import BankingModels
import BankingUtilities

enum CategoriesEndpoint: APIEndpoint {
    case list
    case detail(id: Int)
    case create(CreateCategoryRequest)
    case update(id: Int, request: UpdateCategoryRequest)
    case delete(id: Int)

    var path: String {
        switch self {
        case .list, .create:
            "/categories"
        case .detail(let id), .delete(let id), .update(let id, _):
            "/categories/\(id)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .list, .detail:
                .get
        case .create:
                .post
        case .update:
                .put
        case .delete:
                .delete
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .create(let request):
            request.dictionary()
        case .update(_, let request):
            request.dictionary()
        case .list, .detail, .delete:
            nil
        }
    }
}
