//
//  AppTextField.swift
//  BankingDesignSystem
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import SwiftUI

public struct AppTextField: View {

    private let placeholder: String

    @Binding
    private var text: String

    public init(
        _ placeholder: String,
        text: Binding<String>
    ) {
        self.placeholder = placeholder
        self._text = text
    }

    public var body: some View {
        TextField(
            placeholder,
            text: $text
        )
        .textFieldStyle(.banking)
    }
}
