//
//  LoginViewModel.swift
//  BankingOfflineRoot
//
//  Created by Zakaria Lachkar on 28/8/2026.
//

import Foundation
import BankingModels
import BankingNetworking
import BankingSession
import BankingUtilities

@MainActor
final class LoginViewModel: ObservableObject {

    @Published var isLoading = false
    @Published var loginRequest = LoginRequest()

    private let service: AuthentificationServiceProtocol

    init(
        service: AuthentificationServiceProtocol = AuthentificationService()
    ) {
        self.service = service
    }

    func login() async throws -> User {
        isLoading = true

        defer {
            isLoading = false
        }

        let response = try await service.login(
            request: loginRequest
        )

        let auth = Auth(response: response)

        TokenStore.shared.token = auth.accessToken
        
        return auth.user
    }
}
