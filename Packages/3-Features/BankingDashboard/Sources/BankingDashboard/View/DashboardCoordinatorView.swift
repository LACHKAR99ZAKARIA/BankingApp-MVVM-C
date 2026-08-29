//
//  DashboardCoordinatorView.swift
//  BankingDashboard
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

import SwiftUI

public struct DashboardCoordinatorView: View {
    @StateObject var coordinator = DashboardCoordinator()

    public init() {}

    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            Text("Dashboard")
                .navigationDestination(
                    for: DashboardRoute.self
                ) { route in
                    destination(for: route)
                }
        }
    }

    @ViewBuilder
    private func destination(for route: DashboardRoute) -> some View {
        switch route {
        case .accounts:
            Text("accounts")
        case .accountDetails:
            Text("accountDetails")
        }
    }
}
