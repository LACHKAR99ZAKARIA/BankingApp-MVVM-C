//
//  TransactionModels.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation

public struct FilterTransactionRequest: Codable, Sendable {
    public var month: Int?
    public var year: Int?
    public var categoryId: Int?
    public var type: TransactionType?
    public var bankAccountId: Int?
    public var cardAccountId: Int?
    public var page: Int?
    public var limit: Int?

    public init(
        month: Int? = nil,
        year: Int? = nil,
        categoryId: Int? = nil,
        type: TransactionType? = nil,
        bankAccountId: Int? = nil,
        cardAccountId: Int? = nil,
        page: Int? = nil,
        limit: Int? = nil
    ) {
        self.month = month
        self.year = year
        self.categoryId = categoryId
        self.type = type
        self.bankAccountId = bankAccountId
        self.cardAccountId = cardAccountId
        self.page = page
        self.limit = limit
    }
}

public struct CreateTransactionRequest: Codable, Sendable {
    public var amount: Double
    public var date: String
    public var description: String
    public var note: String?
    public var type: TransactionCreateType
    public var categoryId: Int?
    public var bankAccountId: Int?
    public var cardAccountId: Int?
    public var recurrent: Bool?
    public var frequency: Frequency?
    public var recurrenceEndDate: String?

    public init(
        amount: Double,
        date: String,
        description: String,
        note: String? = nil,
        type: TransactionCreateType,
        categoryId: Int? = nil,
        bankAccountId: Int? = nil,
        cardAccountId: Int? = nil,
        recurrent: Bool? = nil,
        frequency: Frequency? = nil,
        recurrenceEndDate: String? = nil
    ) {
        self.amount = amount
        self.date = date
        self.description = description
        self.note = note
        self.type = type
        self.categoryId = categoryId
        self.bankAccountId = bankAccountId
        self.cardAccountId = cardAccountId
        self.recurrent = recurrent
        self.frequency = frequency
        self.recurrenceEndDate = recurrenceEndDate
    }
}

public struct CreateTransferRequest: Codable, Sendable {
    public var amount: Double
    public var date: String
    public var description: String
    public var note: String?
    public var fromAccountId: Int
    public var toAccountId: Int
    public var recurrent: Bool?
    public var frequency: Frequency?
    public var recurrenceEndDate: String?

    public init(
        amount: Double,
        date: String,
        description: String,
        note: String? = nil,
        fromAccountId: Int,
        toAccountId: Int,
        recurrent: Bool? = nil,
        frequency: Frequency? = nil,
        recurrenceEndDate: String? = nil
    ) {
        self.amount = amount
        self.date = date
        self.description = description
        self.note = note
        self.fromAccountId = fromAccountId
        self.toAccountId = toAccountId
        self.recurrent = recurrent
        self.frequency = frequency
        self.recurrenceEndDate = recurrenceEndDate
    }
}

public struct UpdateTransactionRequest: Codable, Sendable {
    public var amount: Double?
    public var date: String?
    public var description: String?
    public var note: String?
    public var categoryId: Int?
    public var bankAccountId: Int?
    public var cardAccountId: Int?

    public init(
        amount: Double? = nil,
        date: String? = nil,
        description: String? = nil,
        note: String? = nil,
        categoryId: Int? = nil,
        bankAccountId: Int? = nil,
        cardAccountId: Int? = nil
    ) {
        self.amount = amount
        self.date = date
        self.description = description
        self.note = note
        self.categoryId = categoryId
        self.bankAccountId = bankAccountId
        self.cardAccountId = cardAccountId
    }
}

public struct TransferDetailResponse: Codable, Sendable {
    var id: Int?
    var fromAccountId: Int?
    var toAccountId: Int?
    var fromAccount: BankAccountResponse?
    var toAccount: BankAccountResponse?
    var createdDate: Date?
    var updateDate: Date?
}

public struct TransferDetail: Codable, Identifiable, Sendable {
    public let id: Int
    public let fromAccountId: Int
    public let toAccountId: Int
    public let fromAccount: BankAccount
    public let toAccount: BankAccount
    public let createdDate: Date
    public let updateDate: Date

    public init(response: TransferDetailResponse) {
        self.id = response.id ?? 0
        self.fromAccountId = response.fromAccountId ?? 0
        self.toAccountId = response.toAccountId ?? 0
        self.fromAccount = BankAccount(response: response.fromAccount ?? BankAccountResponse())
        self.toAccount = BankAccount(response: response.toAccount ?? BankAccountResponse())
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}

public struct TransactionResponse: Codable, Sendable {
    var id: Int?
    var amount: Double?
    var date: String?
    var description: String?
    var note: String?
    var recurrent: Bool?
    var type: TransactionType?
    var userId: Int?
    var categoryId: Int?
    var bankAccountId: Int?
    var cardAccountId: Int?
    var recurringRuleId: Int?
    var transferDetailId: Int?
    var category: TransactionCategoryResponse?
    var bankAccount: BankAccountResponse?
    var card: CardAccountResponse?
    var transferDetail: TransferDetailResponse?
    var recurringRule: RecurringRuleResponse?
    var createdDate: Date?
    var updateDate: Date?
}

public struct Transaction: Codable, Identifiable, Sendable {
    public let id: Int
    public let amount: Double
    public let date: String
    public let description: String
    public let note: String
    public let recurrent: Bool
    public let type: TransactionType
    public let userId: Int?
    public let categoryId: Int?
    public let bankAccountId: Int?
    public let cardAccountId: Int?
    public let recurringRuleId: Int?
    public let transferDetailId: Int?
    public let category: TransactionCategory?
    public let bankAccount: BankAccount?
    public let card: CardAccount?
    public let transferDetail: TransferDetail?
    public let recurringRule: RecurringRule?
    public let createdDate: Date
    public let updateDate: Date

    public init(response: TransactionResponse) {
        self.id = response.id ?? 0
        self.amount = response.amount ?? 0
        self.date = response.date ?? ""
        self.description = response.description ?? ""
        self.note = response.note ?? ""
        self.recurrent = response.recurrent ?? false
        self.type = response.type ?? .expense
        self.userId = response.userId
        self.categoryId = response.categoryId
        self.bankAccountId = response.bankAccountId
        self.cardAccountId = response.cardAccountId
        self.recurringRuleId = response.recurringRuleId
        self.transferDetailId = response.transferDetailId
        self.category = response.category.map(TransactionCategory.init(response:))
        self.bankAccount = response.bankAccount.map(BankAccount.init(response:))
        self.card = response.card.map(CardAccount.init(response:))
        self.transferDetail = response.transferDetail.map(TransferDetail.init(response:))
        self.recurringRule = response.recurringRule.map(RecurringRule.init(response:))
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}
