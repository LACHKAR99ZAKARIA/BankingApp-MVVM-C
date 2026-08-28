//
//  OfflineRouting.swift
//  BankingNavigationCore
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import Foundation
import SwiftUI

@MainActor
public protocol OfflineRouting: ObservableObject {
    func popToRoot()
    func showRegister()
    func showForgotPassword()
}

public extension EnvironmentValues {
    @Entry var offlineRouting: (any OfflineRouting)? = nil
}
