//
//  TransactionsService.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation
import BankingModels

@MainActor
public protocol TransactionsServiceProtocol {
    func getTransactions(filter: FilterTransactionRequest) async throws -> PaginatedResponse<TransactionResponse>
    func getTransaction(id: Int) async throws -> TransactionResponse
    func createTransaction(request: CreateTransactionRequest) async throws -> TransactionResponse
    func createTransfer(request: CreateTransferRequest) async throws -> TransactionResponse
    func updateTransfer(transferDetailId: Int, request: CreateTransferRequest) async throws -> TransactionResponse
    func updateTransaction(id: Int, request: UpdateTransactionRequest) async throws -> TransactionResponse
    func deleteTransfer(transferDetailId: Int) async throws -> MessageResponse
    func deleteTransaction(id: Int) async throws -> MessageResponse
}

public struct TransactionsService: TransactionsServiceProtocol {
    public init() {}

    public func getTransactions(filter: FilterTransactionRequest) async throws -> PaginatedResponse<TransactionResponse> {
        try await APIManager.shared.performRequest(for: TransactionsEndpoint.list(filter: filter))
    }

    public func getTransaction(id: Int) async throws -> TransactionResponse {
        try await APIManager.shared.performRequest(for: TransactionsEndpoint.detail(id: id))
    }

    public func createTransaction(request: CreateTransactionRequest) async throws -> TransactionResponse {
        try await APIManager.shared.performRequest(for: TransactionsEndpoint.create(request))
    }

    public func createTransfer(request: CreateTransferRequest) async throws -> TransactionResponse {
        try await APIManager.shared.performRequest(for: TransactionsEndpoint.createTransfer(request))
    }

    public func updateTransfer(transferDetailId: Int, request: CreateTransferRequest) async throws -> TransactionResponse {
        try await APIManager.shared.performRequest(
            for: TransactionsEndpoint.updateTransfer(transferDetailId: transferDetailId, request: request)
        )
    }

    public func updateTransaction(id: Int, request: UpdateTransactionRequest) async throws -> TransactionResponse {
        try await APIManager.shared.performRequest(for: TransactionsEndpoint.update(id: id, request: request))
    }

    public func deleteTransfer(transferDetailId: Int) async throws -> MessageResponse {
        try await APIManager.shared.performRequest(
            for: TransactionsEndpoint.deleteTransfer(transferDetailId: transferDetailId)
        )
    }

    public func deleteTransaction(id: Int) async throws -> MessageResponse {
        try await APIManager.shared.performRequest(for: TransactionsEndpoint.delete(id: id))
    }
}
