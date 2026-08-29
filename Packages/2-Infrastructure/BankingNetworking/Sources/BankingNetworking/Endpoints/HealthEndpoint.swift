//
//  HealthEndpoint.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation

enum HealthEndpoint: APIEndpoint {
    case status
    case ready

    var path: String {
        switch self {
        case .status:
            "/health"
        case .ready:
            "/health/ready"
        }
    }

    var method: HTTPMethod {
        .get
    }
}
