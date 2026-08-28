//
//  Route.swift
//  BankingNavigationCore
//
//  Created by Zakaria Lachkar on 28/8/2026.
//

import Foundation

import Foundation

public protocol Route: Hashable, Sendable {
    var navigationType: NavigationType { get }
}
