//
//  CommonEnums.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 29/8/2026.
//

import Foundation

public enum CategoryType: String, Codable, Sendable {
    case income = "INCOME"
    case expense = "EXPENSE"
}

public enum TransactionType: String, Codable, Sendable {
    case income = "INCOME"
    case expense = "EXPENSE"
    case transfer = "TRANSFER"
}

public enum TransactionCreateType: String, Codable, Sendable {
    case income = "INCOME"
    case expense = "EXPENSE"
}

public enum RecurringType: String, Codable, Sendable {
    case income = "INCOME"
    case expense = "EXPENSE"
    case transfer = "TRANSFER"
}

public enum Frequency: String, Codable, Sendable {
    case daily = "DAILY"
    case weekly = "WEEKLY"
    case biweekly = "BIWEEKLY"
    case monthly = "MONTHLY"
    case bimonthly = "BIMONTHLY"
    case quarterly = "QUARTERLY"
    case semiannual = "SEMIANNUAL"
    case yearly = "YEARLY"
}
