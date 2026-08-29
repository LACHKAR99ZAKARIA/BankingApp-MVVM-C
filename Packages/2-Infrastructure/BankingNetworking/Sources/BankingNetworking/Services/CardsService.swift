//
//  CardsService.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation
import BankingModels

@MainActor
public protocol CardsServiceProtocol {
    func getCards() async throws -> [CardAccountResponse]
    func getCard(id: Int) async throws -> CardAccountResponse
    func createCard(request: CreateCardAccountRequest) async throws -> CardAccountResponse
    func updateCard(id: Int, request: UpdateCardAccountRequest) async throws -> CardAccountResponse
    func deleteCard(id: Int) async throws -> MessageResponse
}

public struct CardsService: CardsServiceProtocol {
    public init() {}

    public func getCards() async throws -> [CardAccountResponse] {
        try await APIManager.shared.performRequest(for: CardsEndpoint.list)
    }

    public func getCard(id: Int) async throws -> CardAccountResponse {
        try await APIManager.shared.performRequest(for: CardsEndpoint.detail(id: id))
    }

    public func createCard(request: CreateCardAccountRequest) async throws -> CardAccountResponse {
        try await APIManager.shared.performRequest(for: CardsEndpoint.create(request))
    }

    public func updateCard(id: Int, request: UpdateCardAccountRequest) async throws -> CardAccountResponse {
        try await APIManager.shared.performRequest(for: CardsEndpoint.update(id: id, request: request))
    }

    public func deleteCard(id: Int) async throws -> MessageResponse {
        try await APIManager.shared.performRequest(for: CardsEndpoint.delete(id: id))
    }
}
