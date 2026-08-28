//
//  RootView.swift
//  BankingApp-MVVM-C
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

import SwiftUI
import BankingOnlineRoot
import BankingOfflineRoot
import BankingModels
import BankingSession
import BankingUtilities
import BankingDesignSystem

struct RootView: View {
    @StateObject private var session = SessionManager.shared
    @StateObject private var viewModel = RootViewModel()
    @State private var alert: AlertContext?
    
    var body: some View {
        ZStack {
            if !viewModel.isLoading {
                if session.isOnline {
                    OnlineCoordinatorView()
                } else {
                    OfflineCoordinatorView()
                }
            }
        }
        .alert(
            alert?.title ?? "",
            isPresented: Binding(
                get: { alert != nil },
                set: { isPresented in
                    if !isPresented { alert = nil }
                }
            )
        ) {
            Button("OK", role: .cancel) { }
        } message: {
            if let context = alert {
                Text(context.message)
            }
        }
        .loader(isPresented: viewModel.isLoading)
        .environment(\.session, session)
        .onAppear {
            if TokenStore.shared.token != nil {
                getProfile()
            }
        }
    }
    
    func getProfile() {
        Task {
            do {
                let user = try await viewModel.getProfile()
                
                try await Task.sleep(for: .milliseconds(150))
                SessionManager.shared.save(user)
            } catch {
                alert = .init(message: error.localizedDescription)
                print(error)
            }
        }
    }
}

#Preview {
    RootView()
}
