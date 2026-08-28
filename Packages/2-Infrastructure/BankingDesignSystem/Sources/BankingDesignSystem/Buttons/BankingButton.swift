//
//  BankingButton.swift
//  BankingDesignSystem
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import SwiftUI

public struct BankingButton: View {

    private let title: String
    private let action: () -> Void

    public init(
        _ title: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(
            action: action
        ) {
            Text(title)
        }
        .buttonStyle(.banking)
    }
}
