//
//  DashboardCoordinator.swift
//  BankingDashboard
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

import Foundation
import SwiftUI
import BankingNavigationCore

class DashboardCoordinator: ObservableObject, CoordinatorProtocol {
    @Published var path = NavigationPath()
    
    func navigate(to route: DashboardRoute) {
        switch route.navigationType {
        case .push:
            path.append(route)
        default:
            path.append(route)
        }
    }
}
