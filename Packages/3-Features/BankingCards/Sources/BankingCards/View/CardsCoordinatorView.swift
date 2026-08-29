//
//  CardsCoordinatorView.swift
//  BankingDashboard
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

import SwiftUI

public struct CardsCoordinatorView: View {
    @StateObject var coordinator = CardsCoordinator()

    public init() {}

    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            Text("Dashboard")
                .navigationDestination(
                    for: CardsRoute.self
                ) { route in
                    destination(for: route)
                }
        }
    }

    @ViewBuilder
    private func destination(for route: CardsRoute) -> some View {
        switch route {
        default:
            EmptyView()
        }
    }
}
