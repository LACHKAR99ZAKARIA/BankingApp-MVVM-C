//
//  AuthentificationEndpoint.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 28/8/2026.
//

import Foundation
import BankingModels
import BankingUtilities

enum AuthentificationEndpoint: APIEndpoint {
    case register(Codable)
    case login(Codable)
    case getProfile
    case updateProfile(Codable)
    case deleteProfile
    case changePassword(Codable)

    var path: String {
        switch self {
        case .register:
            "/auth/register"
        case .login:
            "/auth/login"
        case .getProfile:
            "/auth/me"
        case .updateProfile, .deleteProfile:
            "/auth/profile"
        case .changePassword:
            "/auth/change-password"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getProfile:
                .get
        case .register, .login:
                .post
        case .deleteProfile:
                .delete
        case .changePassword, .updateProfile:
                .put
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .register(let request):
            request.dictionary()
        case .login(let request):
            request.dictionary()
        case .updateProfile(let request):
            request.dictionary()
        case .changePassword(let request):
            request.dictionary()
        case .getProfile, .deleteProfile:
            nil
        }
    }
}
