//
//  LoginView.swift
//  BankingOfflineRoot
//
//  Created by Zakaria Lachkar on 28/8/2026.
//

import SwiftUI
import BankingDesignSystem
import BankingModels
import BankingNetworking
import BankingSession

struct LoginView: View {
    @Environment(\.offlineRouting) private var offlineRouting
    @StateObject var viewModel = LoginViewModel()
    @State private var alert: AlertContext?
    
    var body: some View {
        VStack(spacing: 32) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Connectez vous pour se lancer")
                    .font(.title3)
                
                AppTextField("Email", text: $viewModel.loginRequest.email)
                VStack(spacing: 6) {
                    PasswordTextField("Mot de passe", text: $viewModel.loginRequest.password)
                    
                    Button {
                        offlineRouting?.showForgotPassword()
                    } label: {
                        Text("Mot de passe oublié")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                BankingButton("Se connecter", action: login)
                
                Button {
                    offlineRouting?.showForgotPassword()
                } label: {
                    Text("devenir Client")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
            }
            .padding()
            .background(.secondary.opacity(0.5), in: .rect(cornerRadius: 12))
        }
        .padding()
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
    }
    
    func login() {
        Task {
            do {
                let user = try await viewModel.login()
                
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
    LoginView()
}
