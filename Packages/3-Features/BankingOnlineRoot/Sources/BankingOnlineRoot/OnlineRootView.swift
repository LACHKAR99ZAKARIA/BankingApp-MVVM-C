//
//  OnlineRootView.swift
//  BankingOnlineRoot
//
//  Created by Zakaria Lachkar on 27/8/2026.
//


import SwiftUI
import BankingDashboard

public struct OnlineRootView: View {
    @ObservedObject var coordinator: OnlineCoordinator
    
    init(
        coordinator: OnlineCoordinator
    ) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            DashboardCoordinatorView()
                .tag(OnlineTab.home)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("test 2")
                .tag(OnlineTab.cards)
                .tabItem {
                    Label("Cards", systemImage: "creditcard")
                }
            
            Text("test 3")
                .tag(OnlineTab.menu)
                .tabItem {
                    Label("Menu", systemImage: "line.3.horizontal")
                }
        }
        .environment(\.onlineRouting, coordinator)
    }
}
