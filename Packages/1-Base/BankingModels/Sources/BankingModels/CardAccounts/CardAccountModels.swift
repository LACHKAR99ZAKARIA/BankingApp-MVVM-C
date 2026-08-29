//
//  CardAccountModels.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation

public struct CreateCardAccountRequest: Codable, Sendable {
    public var name: String
    public var cardLimit: Double
    public var monthExpiry: Int
    public var yearExpiry: Int
    public var bankAccountId: Int?
    public var cardTypeId: Int?

    public init(
        name: String,
        cardLimit: Double,
        monthExpiry: Int,
        yearExpiry: Int,
        bankAccountId: Int? = nil,
        cardTypeId: Int? = nil
    ) {
        self.name = name
        self.cardLimit = cardLimit
        self.monthExpiry = monthExpiry
        self.yearExpiry = yearExpiry
        self.bankAccountId = bankAccountId
        self.cardTypeId = cardTypeId
    }
}

public struct UpdateCardAccountRequest: Codable, Sendable {
    public var name: String?
    public var cardLimit: Double?
    public var monthExpiry: Int?
    public var yearExpiry: Int?
    public var bankAccountId: Int?
    public var cardTypeId: Int?

    public init(
        name: String? = nil,
        cardLimit: Double? = nil,
        monthExpiry: Int? = nil,
        yearExpiry: Int? = nil,
        bankAccountId: Int? = nil,
        cardTypeId: Int? = nil
    ) {
        self.name = name
        self.cardLimit = cardLimit
        self.monthExpiry = monthExpiry
        self.yearExpiry = yearExpiry
        self.bankAccountId = bankAccountId
        self.cardTypeId = cardTypeId
    }
}

public struct CardAccountResponse: Codable, Sendable {
    var id: Int?
    var name: String?
    var cardLimit: Double?
    var monthExpiry: Int?
    var yearExpiry: Int?
    var userId: Int?
    var bankAccountId: Int?
    var cardTypeId: Int?
    var cardType: CardTypeResponse?
    var bankAccount: BankAccountResponse?
    var createdDate: Date?
    var updateDate: Date?
}

public struct CardAccount: Codable, Identifiable, Sendable {
    public let id: Int
    public let name: String
    public let cardLimit: Double
    public let monthExpiry: Int
    public let yearExpiry: Int
    public let userId: Int
    public let bankAccountId: Int?
    public let cardTypeId: Int?
    public let cardType: CardType?
    public let bankAccount: BankAccount?
    public let createdDate: Date
    public let updateDate: Date

    public init(response: CardAccountResponse) {
        self.id = response.id ?? 0
        self.name = response.name ?? ""
        self.cardLimit = response.cardLimit ?? 0
        self.monthExpiry = response.monthExpiry ?? 0
        self.yearExpiry = response.yearExpiry ?? 0
        self.userId = response.userId ?? 0
        self.bankAccountId = response.bankAccountId
        self.cardTypeId = response.cardTypeId
        self.cardType = response.cardType.map(CardType.init(response:))
        self.bankAccount = response.bankAccount.map(BankAccount.init(response:))
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}
