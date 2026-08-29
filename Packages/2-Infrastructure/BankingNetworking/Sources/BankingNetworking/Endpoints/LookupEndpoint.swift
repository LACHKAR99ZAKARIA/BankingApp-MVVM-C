//
//  LookupEndpoint.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation

enum LookupEndpoint: APIEndpoint {
    case colors
    case categoryIcons
    case bankTypes
    case bankAccountTypes
    case cardTypes

    var path: String {
        switch self {
        case .colors:
            "/lookup/colors"
        case .categoryIcons:
            "/lookup/category-icons"
        case .bankTypes:
            "/lookup/bank-types"
        case .bankAccountTypes:
            "/lookup/bank-account-types"
        case .cardTypes:
            "/lookup/card-types"
        }
    }

    var method: HTTPMethod {
        .get
    }
}
