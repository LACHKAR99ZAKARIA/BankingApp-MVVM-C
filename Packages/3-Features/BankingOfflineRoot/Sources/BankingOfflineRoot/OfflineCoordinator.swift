//
//  OfflineCoordinator.swift
//  BankingOnlineRoot
//
//  Created by Zakaria Lachkar on 27/8/2026.
//


import SwiftUI
import UIKit
import BankingNavigationCore


final class OfflineCoordinator: ObservableObject, CoordinatorProtocol {
    @Published var path = NavigationPath()

    func navigate(to route: OfflineRoute) {
        switch route {
        case .login:
            popToRoot()
        case .register:
            showRegister()
        case .forgotPassword:
            showForgotPassword()
        }
    }
}

extension OfflineCoordinator: OfflineRouting {
    func popToRoot() {
        path = NavigationPath()
    }
    
    func showRegister() {
        path.append(OfflineRoute.register)
    }

    func showForgotPassword() {
        path.append(OfflineRoute.forgotPassword)
    }
}
