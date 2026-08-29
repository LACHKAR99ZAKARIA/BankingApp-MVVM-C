//
//  TransactionsEndpoint.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation
import BankingModels
import BankingUtilities

enum TransactionsEndpoint: APIEndpoint {
    case list(filter: FilterTransactionRequest)
    case detail(id: Int)
    case create(CreateTransactionRequest)
    case createTransfer(CreateTransferRequest)
    case updateTransfer(transferDetailId: Int, request: CreateTransferRequest)
    case update(id: Int, request: UpdateTransactionRequest)
    case deleteTransfer(transferDetailId: Int)
    case delete(id: Int)

    var path: String {
        switch self {
        case .list, .create:
            "/transactions"
        case .detail(let id), .delete(let id), .update(let id, _):
            "/transactions/\(id)"
        case .createTransfer:
            "/transactions/transfer"
        case .updateTransfer(let transferDetailId, _), .deleteTransfer(let transferDetailId):
            "/transactions/transfer/\(transferDetailId)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .list, .detail:
                .get
        case .create, .createTransfer:
                .post
        case .updateTransfer, .update:
                .put
        case .deleteTransfer, .delete:
                .delete
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .create(let request):
            request.dictionary()
        case .createTransfer(let request):
            request.dictionary()
        case .updateTransfer(_, let request):
            request.dictionary()
        case .update(_, let request):
            request.dictionary()
        case .list, .detail, .deleteTransfer, .delete:
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
