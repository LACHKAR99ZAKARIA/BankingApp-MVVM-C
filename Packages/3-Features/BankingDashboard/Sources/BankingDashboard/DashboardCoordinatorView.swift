//
//  DashboardCoordinatorView.swift
//  BankingDashboard
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

import SwiftUI
import BankingNavigationCore

public struct DashboardCoordinatorView: View {
    @Environment(\.onlineRouting) private var onlineRouting
    @StateObject var coordinator = DashboardCoordinator()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                Text("DashboardCoordinatorView")
                    .onTapGesture {
                        coordinator.navigate(to: .accounts)
                    }
                Text("go to transfer")
                    .onTapGesture {
                        onlineRouting?.showTransfer()
                    }
            }
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
            Text("accounts").onTapGesture {
                coordinator.navigate(to: .accountDetails)
            }
        case .accountDetails:
            Text("accountDetails")
        }
    }
}

#Preview {
    DashboardCoordinatorView()
}
