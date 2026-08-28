//
//  SessionManager.swift
//  BankingSession
//
//  Created by Zakaria Lachkar on 28/8/2026.
//

import BankingModels
import BankingUtilities
import SwiftUI

@MainActor
public final class SessionManager: ObservableObject, SessionProtocol {
    public static let shared = SessionManager()
    
    @Published public private(set) var session: User?
    
    private let key = "banking.session"

    private init() {
        session = load()
    }

    public func save(_ session: User) {
        self.session = session

        guard let data = try? JSONEncoder().encode(session) else {
            return
        }

        UserDefaults.standard.set(data, forKey: key)
    }

    public func clear() {
        session = nil
        UserDefaults.standard.removeObject(forKey: key)
    }

    private func load() -> User? {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let session = try? JSONDecoder().decode(User.self, from: data)
        else {
            return nil
        }

        return session
    }
    
    func logout() {
        TokenStore.shared.clear()
    }
}

public extension EnvironmentValues {
    @Entry var session: (any SessionProtocol)? = nil
}
