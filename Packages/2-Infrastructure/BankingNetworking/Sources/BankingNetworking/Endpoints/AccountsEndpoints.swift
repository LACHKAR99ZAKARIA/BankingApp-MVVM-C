//
//  AccountsEndpoints.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation
import BankingModels
import BankingUtilities

enum AccountsEndpoint: APIEndpoint {
    case list
    case detail(id: Int)
    case create(CreateBankAccountRequest)
    case update(id: Int, request: UpdateBankAccountRequest)
    case delete(id: Int)

    var path: String {
        switch self {
        case .list, .create:
            "/bank-accounts"
        case .detail(let id), .delete(let id), .update(let id, _):
            "/bank-accounts/\(id)"
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
