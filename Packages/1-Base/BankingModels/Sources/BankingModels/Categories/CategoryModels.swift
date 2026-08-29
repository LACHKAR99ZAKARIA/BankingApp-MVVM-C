//
//  CategoryModels.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation

public struct CreateCategoryRequest: Codable, Sendable {
    public var name: String
    public var type: CategoryType
    public var colorId: Int
    public var iconId: Int?

    public init(
        name: String,
        type: CategoryType,
        colorId: Int,
        iconId: Int? = nil
    ) {
        self.name = name
        self.type = type
        self.colorId = colorId
        self.iconId = iconId
    }
}

public struct UpdateCategoryRequest: Codable, Sendable {
    public var name: String?
    public var type: CategoryType?
    public var colorId: Int?
    public var iconId: Int?

    public init(
        name: String? = nil,
        type: CategoryType? = nil,
        colorId: Int? = nil,
        iconId: Int? = nil
    ) {
        self.name = name
        self.type = type
        self.colorId = colorId
        self.iconId = iconId
    }
}

public struct TransactionCategoryResponse: Codable, Sendable {
    var id: Int?
    var name: String?
    var type: CategoryType?
    var userId: Int?
    var colorId: Int?
    var iconId: Int?
    var categoryColor: ColorOptionResponse?
    var categoryIcon: CategoryIconResponse?
    var createdDate: Date?
    var updateDate: Date?
}

public struct TransactionCategory: Codable, Identifiable, Sendable {
    public let id: Int
    public let name: String
    public let type: CategoryType
    public let userId: Int
    public let colorId: Int
    public let iconId: Int?
    public let categoryColor: ColorOption
    public let categoryIcon: CategoryIcon?
    public let createdDate: Date
    public let updateDate: Date

    public init(response: TransactionCategoryResponse) {
        self.id = response.id ?? 0
        self.name = response.name ?? ""
        self.type = response.type ?? .expense
        self.userId = response.userId ?? 0
        self.colorId = response.colorId ?? 0
        self.iconId = response.iconId
        self.categoryColor = ColorOption(response: response.categoryColor ?? ColorOptionResponse())
        self.categoryIcon = response.categoryIcon.map(CategoryIcon.init(response:))
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}
