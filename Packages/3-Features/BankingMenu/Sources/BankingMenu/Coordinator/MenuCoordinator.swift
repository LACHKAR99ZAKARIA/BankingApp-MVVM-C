//
//  MenuCoordinator.swift
//  BankingDashboard
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

import Foundation
import SwiftUI
import BankingNavigationCore

class MenuCoordinator: ObservableObject, CoordinatorProtocol {
    @Published var path = NavigationPath()

    func navigate(to route: MenuRoute) {
        path.append(route)
    }
}
