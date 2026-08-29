//
//  CardsCoordinator.swift
//  BankingDashboard
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

import Foundation
import SwiftUI
import BankingNavigationCore

class CardsCoordinator: ObservableObject, CoordinatorProtocol {
    @Published var path = NavigationPath()

    func navigate(to route: CardsRoute) {
        path.append(route)
    }
}
