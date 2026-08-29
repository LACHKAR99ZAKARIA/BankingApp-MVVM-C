//
//  HealthService.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation
import BankingModels

struct EmptyResponse: Decodable, Sendable {}

@MainActor
public protocol HealthServiceProtocol {
    func getStatus() async throws -> HealthStatus
    func checkReady() async throws
}

public struct HealthService: HealthServiceProtocol {
    public init() {}

    public func getStatus() async throws -> HealthStatus {
        try await APIManager.shared.performRequest(for: HealthEndpoint.status)
    }

    public func checkReady() async throws {
        let _: EmptyResponse = try await APIManager.shared.performRequest(for: HealthEndpoint.ready)
    }
}
