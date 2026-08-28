//
//  User.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 28/8/2026.
//

import Foundation

public struct UserResponse: Codable, Sendable {
    var id: Int?
    var email: String?
    var name: String?
    var surname: String?
    var birthDate: Date?
    var sex: String?
    var imageUrl: String?
    var acceptedTerms: Bool?
    var token: String?
    var createdDate: Date?
    var updateDate: Date?
}

public struct AuthResponse: Codable, Sendable {
    public var accessToken: String?
    public var user: UserResponse?
}

public struct MessageResponse: Codable, Sendable {
    var message: String?
}

public struct User: Codable, Identifiable, Sendable {
    public var id: Int
    public var email: String
    public var name: String?
    public var surname: String?
    public var birthDate: Date?
    public var sex: String?
    public var imageUrl: String?
    public var acceptedTerms: Bool
    public var token: String?
    public var createdDate: Date
    public var updateDate: Date

    public init(response: UserResponse) {
        self.id = response.id ?? 0
        self.email = response.email ?? ""
        self.name = response.name
        self.surname = response.surname
        self.birthDate = response.birthDate
        self.sex = response.sex
        self.imageUrl = response.imageUrl
        self.acceptedTerms = response.acceptedTerms ?? false
        self.token = response.token
        self.createdDate = response.createdDate ?? Date()
        self.updateDate = response.updateDate ?? Date()
    }
}

public struct Auth: Codable, Sendable {
    public var accessToken: String
    public var user: User

    public init(response: AuthResponse) {
        self.accessToken = response.accessToken ?? ""
        self.user = User(response: response.user ?? UserResponse())
    }
}

public struct Message: Codable, Sendable {
    public var message: String

    init(response: MessageResponse) {
        self.message = response.message ?? ""
    }
}
