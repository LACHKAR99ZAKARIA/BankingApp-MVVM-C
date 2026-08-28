//
//  RegisterRequest.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 28/8/2026.
//

import Foundation

public struct RegisterRequest: Codable, Sendable {
    var email: String
    var password: String
    var name: String?
    var surname: String?
    var sex: String?
    var acceptedTermsvar: Bool = true
}

public struct LoginRequest: Codable, Sendable {
    public var email: String
    public var password: String
    
    public init() {
        email = ""
        password = ""
    }
}

public struct UpdateProfileRequest: Codable, Sendable {
    var name: String?
    var surname: String?
    var birthDate: String?
    var sex: String?
    var imageUrl: String?
}

public struct ChangePasswordRequest: Codable, Sendable {
    var currentPassword: String
    var newPassword: String
}
