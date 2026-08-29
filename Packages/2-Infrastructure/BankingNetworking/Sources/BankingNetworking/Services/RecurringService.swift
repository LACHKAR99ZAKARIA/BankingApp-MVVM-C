//
//  RecurringService.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation
import BankingModels

@MainActor
public protocol RecurringServiceProtocol {
    func getRecurringRules(filter: FilterRecurringRuleRequest) async throws -> PaginatedResponse<RecurringRuleResponse>
    func getRecurringRule(id: Int) async throws -> RecurringRuleResponse
    func createRecurringRule(request: CreateRecurringRuleRequest) async throws -> RecurringRuleResponse
    func generate() async throws -> GenerateResult
    func updateRecurringRule(id: Int, request: UpdateRecurringRuleRequest) async throws -> RecurringRuleResponse
    func deleteRecurringRule(id: Int) async throws -> MessageResponse
}

public struct RecurringService: RecurringServiceProtocol {
    public init() {}

    public func getRecurringRules(filter: FilterRecurringRuleRequest) async throws -> PaginatedResponse<RecurringRuleResponse> {
        try await APIManager.shared.performRequest(for: RecurringEndpoint.list(filter: filter))
    }

    public func getRecurringRule(id: Int) async throws -> RecurringRuleResponse {
        try await APIManager.shared.performRequest(for: RecurringEndpoint.detail(id: id))
    }

    public func createRecurringRule(request: CreateRecurringRuleRequest) async throws -> RecurringRuleResponse {
        try await APIManager.shared.performRequest(for: RecurringEndpoint.create(request))
    }

    public func generate() async throws -> GenerateResult {
        try await APIManager.shared.performRequest(for: RecurringEndpoint.generate)
    }

    public func updateRecurringRule(id: Int, request: UpdateRecurringRuleRequest) async throws -> RecurringRuleResponse {
        try await APIManager.shared.performRequest(for: RecurringEndpoint.update(id: id, request: request))
    }

    public func deleteRecurringRule(id: Int) async throws -> MessageResponse {
        try await APIManager.shared.performRequest(for: RecurringEndpoint.delete(id: id))
    }
}
