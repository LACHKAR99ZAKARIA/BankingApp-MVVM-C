//
//  LoaderView.swift
//  BankingDesignSystem
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import SwiftUI

public struct LoaderView: View {

    public init() {}

    public var body: some View {
        ZStack {
            Color.black
                .opacity(0.25)

            ProgressView()
                .controlSize(.large)
                .padding(24)
                .background(
                    .regularMaterial,
                    in: .rect(cornerRadius: 16)
                )
        }
        .ignoresSafeArea()
    }
}

public extension View {
    func loader(
        isPresented: Bool
    ) -> some View {
        modifier(
            FullScreenLoaderModifier(
                isPresented: isPresented
            )
        )
    }
}
