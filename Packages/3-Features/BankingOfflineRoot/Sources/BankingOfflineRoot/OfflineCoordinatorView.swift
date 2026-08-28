//
//  OfflineCoordinatorView.swift
//  BankingOnlineRoot
//
//  Created by Zakaria Lachkar on 27/8/2026.
//


import SwiftUI

public struct OfflineCoordinatorView: View {
    @StateObject var coordinator = OfflineCoordinator()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            LoginView()
                .navigationDestination(
                    for: OfflineRoute.self
                ) { route in
                    destination(for: route)
                }
                .environment(\.offlineRouting, coordinator)
        }
    }
    
    @ViewBuilder
    private func destination(for route: OfflineRoute) -> some View {
        switch route {
        case .register:
            Text("register")
                .onTapGesture {
                    coordinator.navigate(to: .login)
                }
        case .forgotPassword:
            Text("login")
        default:
            EmptyView()
        }
    }
}
