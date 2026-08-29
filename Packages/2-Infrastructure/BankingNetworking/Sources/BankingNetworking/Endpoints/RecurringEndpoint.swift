//
//  RecurringEndpoint.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation
import BankingModels
import BankingUtilities

enum RecurringEndpoint: APIEndpoint {
    case list(filter: FilterRecurringRuleRequest)
    case detail(id: Int)
    case create(CreateRecurringRuleRequest)
    case generate
    case update(id: Int, request: UpdateRecurringRuleRequest)
    case delete(id: Int)

    var path: String {
        switch self {
        case .list, .create:
            "/recurring"
        case .generate:
            "/recurring/generate"
        case .detail(let id), .delete(let id), .update(let id, _):
            "/recurring/\(id)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .list, .detail:
                .get
        case .create, .generate:
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
        case .list, .detail, .generate, .delete:
            nil
        }
    }

    var query: [String: Any]? {
        switch self {
        case .list(let filter):
            filter.dictionary()
        default:
            nil
        }
    }
}
