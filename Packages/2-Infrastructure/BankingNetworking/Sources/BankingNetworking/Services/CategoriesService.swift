//
//  CategoriesService.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation
import BankingModels

@MainActor
public protocol CategoriesServiceProtocol {
    func getCategories() async throws -> [TransactionCategoryResponse]
    func getCategory(id: Int) async throws -> TransactionCategoryResponse
    func createCategory(request: CreateCategoryRequest) async throws -> TransactionCategoryResponse
    func updateCategory(id: Int, request: UpdateCategoryRequest) async throws -> TransactionCategoryResponse
    func deleteCategory(id: Int) async throws -> MessageResponse
}

public struct CategoriesService: CategoriesServiceProtocol {
    public init() {}

    public func getCategories() async throws -> [TransactionCategoryResponse] {
        try await APIManager.shared.performRequest(for: CategoriesEndpoint.list)
    }

    public func getCategory(id: Int) async throws -> TransactionCategoryResponse {
        try await APIManager.shared.performRequest(for: CategoriesEndpoint.detail(id: id))
    }

    public func createCategory(request: CreateCategoryRequest) async throws -> TransactionCategoryResponse {
        try await APIManager.shared.performRequest(for: CategoriesEndpoint.create(request))
    }

    public func updateCategory(id: Int, request: UpdateCategoryRequest) async throws -> TransactionCategoryResponse {
        try await APIManager.shared.performRequest(for: CategoriesEndpoint.update(id: id, request: request))
    }

    public func deleteCategory(id: Int) async throws -> MessageResponse {
        try await APIManager.shared.performRequest(for: CategoriesEndpoint.delete(id: id))
    }
}
