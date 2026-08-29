//
//  LookupModels.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation

public struct ColorOptionResponse: Codable, Sendable {
    var id: Int?
    var hexCode: String?
    var createdDate: Date?
    var updateDate: Date?
}

public struct ColorOption: Codable, Identifiable, Sendable {
    public let id: Int
    public let hexCode: String
    public let createdDate: Date
    public let updateDate: Date

    public init(response: ColorOptionResponse) {
        self.id = response.id ?? 0
        self.hexCode = response.hexCode ?? ""
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}

public struct CategoryIconResponse: Codable, Sendable {
    var id: Int?
    var iconName: String?
    var createdDate: Date?
    var updateDate: Date?
}

public struct CategoryIcon: Codable, Identifiable, Sendable {
    public let id: Int
    public let iconName: String
    public let createdDate: Date
    public let updateDate: Date

    public init(response: CategoryIconResponse) {
        self.id = response.id ?? 0
        self.iconName = response.iconName ?? ""
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}

public struct BankTypeResponse: Codable, Sendable {
    var id: Int?
    var name: String?
    var imageUrl: String?
    var createdDate: Date?
    var updateDate: Date?
}

public struct BankType: Codable, Identifiable, Sendable {
    public let id: Int
    public let name: String
    public let imageUrl: String
    public let createdDate: Date
    public let updateDate: Date

    public init(response: BankTypeResponse) {
        self.id = response.id ?? 0
        self.name = response.name ?? ""
        self.imageUrl = response.imageUrl ?? ""
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}

public struct BankAccountTypeResponse: Codable, Sendable {
    var id: Int?
    var name: String?
    var createdDate: Date?
    var updateDate: Date?
}

public struct BankAccountType: Codable, Identifiable, Sendable {
    public let id: Int
    public let name: String
    public let createdDate: Date
    public let updateDate: Date

    public init(response: BankAccountTypeResponse) {
        self.id = response.id ?? 0
        self.name = response.name ?? ""
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}

public struct CardTypeResponse: Codable, Sendable {
    var id: Int?
    var name: String?
    var imageUrl: String?
    var createdDate: Date?
    var updateDate: Date?
}

public struct CardType: Codable, Identifiable, Sendable {
    public let id: Int
    public let name: String
    public let imageUrl: String
    public let createdDate: Date
    public let updateDate: Date

    public init(response: CardTypeResponse) {
        self.id = response.id ?? 0
        self.name = response.name ?? ""
        self.imageUrl = response.imageUrl ?? ""
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}
