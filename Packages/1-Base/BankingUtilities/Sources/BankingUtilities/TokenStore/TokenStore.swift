//
//  TokenStore.swift
//  BankingUtilities
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import Foundation

@MainActor
public final class TokenStore {
    public static let shared = TokenStore()
    private init() {}

    public var token: String?

    public func clear() {
        token = nil
    }
}
