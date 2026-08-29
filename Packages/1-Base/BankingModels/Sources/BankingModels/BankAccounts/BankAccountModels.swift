//
//  BankAccountModels.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation

public struct CreateBankAccountRequest: Codable, Sendable {
    public var name: String
    public var startingBalance: Double
    public var colorId: Int?
    public var bankTypeId: Int?
    public var bankAccountTypeId: Int?

    public init(
        name: String,
        startingBalance: Double,
        colorId: Int? = nil,
        bankTypeId: Int? = nil,
        bankAccountTypeId: Int? = nil
    ) {
        self.name = name
        self.startingBalance = startingBalance
        self.colorId = colorId
        self.bankTypeId = bankTypeId
        self.bankAccountTypeId = bankAccountTypeId
    }
}

public struct UpdateBankAccountRequest: Codable, Sendable {
    public var name: String?
    public var startingBalance: Double?
    public var colorId: Int?
    public var bankTypeId: Int?
    public var bankAccountTypeId: Int?

    public init(
        name: String? = nil,
        startingBalance: Double? = nil,
        colorId: Int? = nil,
        bankTypeId: Int? = nil,
        bankAccountTypeId: Int? = nil
    ) {
        self.name = name
        self.startingBalance = startingBalance
        self.colorId = colorId
        self.bankTypeId = bankTypeId
        self.bankAccountTypeId = bankAccountTypeId
    }
}

public struct BankAccountResponse: Codable, Sendable {
    var id: Int?
    var name: String?
    var startingBalance: Double?
    var userId: Int?
    var colorId: Int?
    var bankTypeId: Int?
    var bankAccountTypeId: Int?
    var color: ColorOptionResponse?
    var bankType: BankTypeResponse?
    var bankAccountType: BankAccountTypeResponse?
    var createdDate: Date?
    var updateDate: Date?
}

public struct BankAccount: Codable, Identifiable, Sendable {
    public let id: Int
    public let name: String
    public let startingBalance: Double
    public let userId: Int
    public let colorId: Int?
    public let bankTypeId: Int?
    public let bankAccountTypeId: Int?
    public let color: ColorOption?
    public let bankType: BankType?
    public let bankAccountType: BankAccountType?
    public let createdDate: Date
    public let updateDate: Date

    public init(response: BankAccountResponse) {
        self.id = response.id ?? 0
        self.name = response.name ?? ""
        self.startingBalance = response.startingBalance ?? 0
        self.userId = response.userId ?? 0
        self.colorId = response.colorId
        self.bankTypeId = response.bankTypeId
        self.bankAccountTypeId = response.bankAccountTypeId
        self.color = response.color.map(ColorOption.init(response:))
        self.bankType = response.bankType.map(BankType.init(response:))
        self.bankAccountType = response.bankAccountType.map(BankAccountType.init(response:))
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}
