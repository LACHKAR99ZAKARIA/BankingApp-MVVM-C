//
//  BankingTextFieldStyle.swift
//  BankingDesignSystem
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import SwiftUI

public struct BankingTextFieldStyle: TextFieldStyle {

    public func _body(
        configuration: TextField<Self._Label>
    ) -> some View {
        configuration
            .font(.footnote)
            .padding(16)
            .background(
                Color(.secondarySystemBackground),
                in: .rect(cornerRadius: 12)
            )
    }
}

public extension TextFieldStyle where Self == BankingTextFieldStyle {

    static var banking: BankingTextFieldStyle {
        BankingTextFieldStyle()
    }
}
