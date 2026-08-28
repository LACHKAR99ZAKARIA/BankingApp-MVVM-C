//
//  RootViewModel.swift
//  BankingApp-MVVM-C
//
//  Created by Zakaria Lachkar on 28/8/2026.
//

import Foundation
import BankingModels
import BankingNetworking
import BankingSession
internal import Combine

@MainActor
final class RootViewModel: ObservableObject {
    @Published var isLoading = false
    private let service: any AuthentificationServiceProtocol

    init(
        service: (any AuthentificationServiceProtocol)? = nil
    ) {
        self.service = service ?? AuthentificationService()
    }

    func getProfile() async throws -> User {
        isLoading = true
        defer {
            isLoading = false
        }

        let response = try await service.getProfile()
        
        print(response)
        
        return User(response: response)
    }
}
