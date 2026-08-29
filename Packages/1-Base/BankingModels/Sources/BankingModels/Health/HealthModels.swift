//
//  HealthModels.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation

public struct HealthStatus: Codable, Sendable {
    public let status: String
    public let timestamp: String
    public let uptime: Double
}
