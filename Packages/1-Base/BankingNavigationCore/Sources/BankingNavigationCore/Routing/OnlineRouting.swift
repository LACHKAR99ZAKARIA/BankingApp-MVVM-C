//
//  OnlineRouting.swift
//  BankingNavigationCore
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

import Foundation
import SwiftUI

@MainActor
public protocol OnlineRouting: ObservableObject {
    func showTransfer()
    func showNotification()
    func showBeneficiaries()
    func showProfile()
    func popToRoot()
}

public extension EnvironmentValues {
    @Entry var onlineRouting: (any OnlineRouting)? = nil
}
