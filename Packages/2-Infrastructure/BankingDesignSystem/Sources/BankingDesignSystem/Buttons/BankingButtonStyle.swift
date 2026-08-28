//
//  BankingButtonStyle.swift
//  BankingDesignSystem
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import SwiftUI

public struct BankingButtonStyle: ButtonStyle {

    @Environment(\.isEnabled)
    private var isEnabled

    public init() {}

    public func makeBody(
        configuration: Configuration
    ) -> some View {
        configuration.label
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(
                Color.orange,
                in: .rect(cornerRadius: 16)
            )
            .opacity(opacity(configuration))
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(
                .easeOut(duration: 0.15),
                value: configuration.isPressed
            )
    }

    private func opacity(
        _ configuration: Configuration
    ) -> Double {
        if !isEnabled {
            return 0.4
        }

        return configuration.isPressed ? 0.8 : 1
    }
}

public extension ButtonStyle where Self == BankingButtonStyle {
    static var banking: BankingButtonStyle {
        BankingButtonStyle()
    }
}
