//
//  AuthentificationService.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 28/8/2026.
//

import Foundation
import BankingModels

@MainActor
public protocol AuthentificationServiceProtocol {
    func register(request: RegisterRequest) async throws -> AuthResponse
    func login(request: LoginRequest) async throws -> AuthResponse
    func getProfile() async throws -> UserResponse
    func updateProfile(request: UpdateProfileRequest) async throws -> UserResponse
    func deleteProfile() async throws -> MessageResponse
    func changePassword(request: ChangePasswordRequest) async throws -> MessageResponse
}

public struct AuthentificationService: AuthentificationServiceProtocol {
    public init() {}
    
    public func register(request: RegisterRequest) async throws -> AuthResponse {
        try await APIManager.shared.performRequest(for: AuthentificationEndpoint.register(request))
    }

    public func login(request: LoginRequest) async throws -> AuthResponse {
        try await APIManager.shared.performRequest(for: AuthentificationEndpoint.login(request))
    }

    public func getProfile() async throws -> UserResponse {
        try await APIManager.shared.performRequest(for: AuthentificationEndpoint.getProfile)
    }

    public func updateProfile(request: UpdateProfileRequest) async throws -> UserResponse {
        try await APIManager.shared.performRequest(for: AuthentificationEndpoint.updateProfile(request))
    }

    public func deleteProfile() async throws -> MessageResponse {
        try await APIManager.shared.performRequest(for: AuthentificationEndpoint.deleteProfile)
    }

    public func changePassword(request: ChangePasswordRequest) async throws -> MessageResponse {
        try await APIManager.shared.performRequest(for: AuthentificationEndpoint.changePassword(request))
    }
}
