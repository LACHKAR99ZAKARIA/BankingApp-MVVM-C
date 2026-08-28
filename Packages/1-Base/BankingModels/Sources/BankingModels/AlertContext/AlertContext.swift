
//
//  AlertContext.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 28/8/2026.
//

import Foundation

public struct AlertContext: Identifiable {
    public let id = UUID()
    public let title: String?
    public let message: String
    
    public init(_ title: String? = nil, message: String) {
        self.title = title
        self.message = message
    }
}
