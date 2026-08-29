//
//  RecurringRuleModels.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation

public struct FilterRecurringRuleRequest: Codable, Sendable {
    public var type: RecurringType?
    public var frequency: Frequency?
    public var isActive: Bool?
    public var categoryId: Int?
    public var bankAccountId: Int?
    public var page: Int?
    public var limit: Int?

    public init(
        type: RecurringType? = nil,
        frequency: Frequency? = nil,
        isActive: Bool? = nil,
        categoryId: Int? = nil,
        bankAccountId: Int? = nil,
        page: Int? = nil,
        limit: Int? = nil
    ) {
        self.type = type
        self.frequency = frequency
        self.isActive = isActive
        self.categoryId = categoryId
        self.bankAccountId = bankAccountId
        self.page = page
        self.limit = limit
    }
}

public struct CreateRecurringRuleRequest: Codable, Sendable {
    public var description: String
    public var amount: Double
    public var type: RecurringType
    public var frequency: Frequency
    public var startDate: String
    public var endDate: String?
    public var note: String?
    public var categoryId: Int?
    public var bankAccountId: Int?
    public var cardAccountId: Int?
    public var fromAccountId: Int?
    public var toAccountId: Int?

    public init(
        description: String,
        amount: Double,
        type: RecurringType,
        frequency: Frequency,
        startDate: String,
        endDate: String? = nil,
        note: String? = nil,
        categoryId: Int? = nil,
        bankAccountId: Int? = nil,
        cardAccountId: Int? = nil,
        fromAccountId: Int? = nil,
        toAccountId: Int? = nil
    ) {
        self.description = description
        self.amount = amount
        self.type = type
        self.frequency = frequency
        self.startDate = startDate
        self.endDate = endDate
        self.note = note
        self.categoryId = categoryId
        self.bankAccountId = bankAccountId
        self.cardAccountId = cardAccountId
        self.fromAccountId = fromAccountId
        self.toAccountId = toAccountId
    }
}

public struct UpdateRecurringRuleRequest: Codable, Sendable {
    public var description: String?
    public var amount: Double?
    public var type: RecurringType?
    public var frequency: Frequency?
    public var startDate: String?
    public var endDate: String?
    public var note: String?
    public var categoryId: Int?
    public var bankAccountId: Int?
    public var cardAccountId: Int?
    public var fromAccountId: Int?
    public var toAccountId: Int?
    public var isActive: Bool?

    public init(
        description: String? = nil,
        amount: Double? = nil,
        type: RecurringType? = nil,
        frequency: Frequency? = nil,
        startDate: String? = nil,
        endDate: String? = nil,
        note: String? = nil,
        categoryId: Int? = nil,
        bankAccountId: Int? = nil,
        cardAccountId: Int? = nil,
        fromAccountId: Int? = nil,
        toAccountId: Int? = nil,
        isActive: Bool? = nil
    ) {
        self.description = description
        self.amount = amount
        self.type = type
        self.frequency = frequency
        self.startDate = startDate
        self.endDate = endDate
        self.note = note
        self.categoryId = categoryId
        self.bankAccountId = bankAccountId
        self.cardAccountId = cardAccountId
        self.fromAccountId = fromAccountId
        self.toAccountId = toAccountId
        self.isActive = isActive
    }
}

public struct RecurringRuleResponse: Codable, Sendable {
    var id: Int?
    var amount: Double?
    var description: String?
    var note: String?
    var type: RecurringType?
    var frequency: Frequency?
    var isActive: Bool?
    var startDate: String?
    var endDate: String?
    var dayOfMonth: Int?
    var dayOfWeek: String?
    var lastGeneratedDate: String?
    var userId: Int?
    var categoryId: Int?
    var bankAccountId: Int?
    var cardAccountId: Int?
    var fromAccountId: Int?
    var toAccountId: Int?
    var category: TransactionCategoryResponse?
    var bankAccount: BankAccountResponse?
    var card: CardAccountResponse?
    var fromAccount: BankAccountResponse?
    var toAccount: BankAccountResponse?
    var createdDate: Date?
    var updateDate: Date?
}

public struct RecurringRule: Codable, Identifiable, Sendable {
    public let id: Int
    public let amount: Double
    public let description: String
    public let note: String
    public let type: RecurringType
    public let frequency: Frequency
    public let isActive: Bool
    public let startDate: String
    public let endDate: String?
    public let dayOfMonth: Int?
    public let dayOfWeek: String?
    public let lastGeneratedDate: String?
    public let userId: Int
    public let categoryId: Int?
    public let bankAccountId: Int?
    public let cardAccountId: Int?
    public let fromAccountId: Int?
    public let toAccountId: Int?
    public let category: TransactionCategory?
    public let bankAccount: BankAccount?
    public let card: CardAccount?
    public let fromAccount: BankAccount?
    public let toAccount: BankAccount?
    public let createdDate: Date
    public let updateDate: Date

    public init(response: RecurringRuleResponse) {
        self.id = response.id ?? 0
        self.amount = response.amount ?? 0
        self.description = response.description ?? ""
        self.note = response.note ?? ""
        self.type = response.type ?? .expense
        self.frequency = response.frequency ?? .monthly
        self.isActive = response.isActive ?? false
        self.startDate = response.startDate ?? ""
        self.endDate = response.endDate
        self.dayOfMonth = response.dayOfMonth
        self.dayOfWeek = response.dayOfWeek
        self.lastGeneratedDate = response.lastGeneratedDate
        self.userId = response.userId ?? 0
        self.categoryId = response.categoryId
        self.bankAccountId = response.bankAccountId
        self.cardAccountId = response.cardAccountId
        self.fromAccountId = response.fromAccountId
        self.toAccountId = response.toAccountId
        self.category = response.category.map(TransactionCategory.init(response:))
        self.bankAccount = response.bankAccount.map(BankAccount.init(response:))
        self.card = response.card.map(CardAccount.init(response:))
        self.fromAccount = response.fromAccount.map(BankAccount.init(response:))
        self.toAccount = response.toAccount.map(BankAccount.init(response:))
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}

public struct GenerateResult: Codable, Sendable {
    public let generated: Int
    public let message: String
}
