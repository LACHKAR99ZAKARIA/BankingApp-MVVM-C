//
//  PaginationMeta.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation

public struct PaginationMeta: Codable, Sendable {
    public let total: Int
    public let page: Int
    public let limit: Int
    public let totalPages: Int
}

public struct PaginatedResponse<T: Decodable & Sendable>: Decodable, Sendable {
    public let data: [T]
    public let meta: PaginationMeta
}
