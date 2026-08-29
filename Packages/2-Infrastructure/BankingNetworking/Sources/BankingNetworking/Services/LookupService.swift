//
//  LookupService.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation
import BankingModels

@MainActor
public protocol LookupServiceProtocol {
    func getColors() async throws -> [ColorOptionResponse]
    func getCategoryIcons() async throws -> [CategoryIconResponse]
    func getBankTypes() async throws -> [BankTypeResponse]
    func getBankAccountTypes() async throws -> [BankAccountTypeResponse]
    func getCardTypes() async throws -> [CardTypeResponse]
}

public struct LookupService: LookupServiceProtocol {
    public init() {}

    public func getColors() async throws -> [ColorOptionResponse] {
        try await APIManager.shared.performRequest(for: LookupEndpoint.colors)
    }

    public func getCategoryIcons() async throws -> [CategoryIconResponse] {
        try await APIManager.shared.performRequest(for: LookupEndpoint.categoryIcons)
    }

    public func getBankTypes() async throws -> [BankTypeResponse] {
        try await APIManager.shared.performRequest(for: LookupEndpoint.bankTypes)
    }

    public func getBankAccountTypes() async throws -> [BankAccountTypeResponse] {
        try await APIManager.shared.performRequest(for: LookupEndpoint.bankAccountTypes)
    }

    public func getCardTypes() async throws -> [CardTypeResponse] {
        try await APIManager.shared.performRequest(for: LookupEndpoint.cardTypes)
    }
}
