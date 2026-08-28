//
//  SessionProviding.swift
//  BankingSession
//
//  Created by Zakaria Lachkar on 28/8/2026.
//

import BankingModels

@MainActor
public protocol SessionProtocol: Sendable {
    var session: User? { get }
    var isOnline: Bool { get }
    var accessToken: String? { get }
    func save(_ session: User)
    func clear()
}

public extension SessionProtocol {
    var accessToken: String? {
        session?.token
    }

    var isOnline: Bool {
        session != nil
    }
}
