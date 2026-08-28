//
//  CoordinatorProtocol.swift
//  BankingNavigationCore
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

@MainActor
public protocol CoordinatorProtocol: AnyObject {
    associatedtype Route
    func navigate(to route: Route)
}
