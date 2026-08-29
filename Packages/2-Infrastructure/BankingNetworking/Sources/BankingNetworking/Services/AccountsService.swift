//
//  AccountsService.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation
import BankingModels

@MainActor
public protocol AccountsServiceProtocol {
    func getAccounts() async throws -> [BankAccountResponse]
    func getAccount(id: Int) async throws -> BankAccountResponse
    func createAccount(request: CreateBankAccountRequest) async throws -> BankAccountResponse
    func updateAccount(id: Int, request: UpdateBankAccountRequest) async throws -> BankAccountResponse
    func deleteAccount(id: Int) async throws -> MessageResponse
}

public struct AccountsService: AccountsServiceProtocol {
    public init() {}

    public func getAccounts() async throws -> [BankAccountResponse] {
        try await APIManager.shared.performRequest(for: AccountsEndpoint.list)
    }

    public func getAccount(id: Int) async throws -> BankAccountResponse {
        try await APIManager.shared.performRequest(for: AccountsEndpoint.detail(id: id))
    }

    public func createAccount(request: CreateBankAccountRequest) async throws -> BankAccountResponse {
        try await APIManager.shared.performRequest(for: AccountsEndpoint.create(request))
    }

    public func updateAccount(id: Int, request: UpdateBankAccountRequest) async throws -> BankAccountResponse {
        try await APIManager.shared.performRequest(for: AccountsEndpoint.update(id: id, request: request))
    }

    public func deleteAccount(id: Int) async throws -> MessageResponse {
        try await APIManager.shared.performRequest(for: AccountsEndpoint.delete(id: id))
    }
}
