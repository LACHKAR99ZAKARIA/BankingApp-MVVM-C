//
//  MenuCoordinatorView.swift
//  BankingDashboard
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

import SwiftUI

public struct MenuCoordinatorView: View {
    @StateObject var coordinator = MenuCoordinator()

    public init() {}

    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            Text("Dashboard")
                .navigationDestination(
                    for: MenuRoute.self
                ) { route in
                    destination(for: route)
                }
        }
    }

    @ViewBuilder
    private func destination(for route: MenuRoute) -> some View {
        switch route {
        default:
            EmptyView()
        }
    }
}
