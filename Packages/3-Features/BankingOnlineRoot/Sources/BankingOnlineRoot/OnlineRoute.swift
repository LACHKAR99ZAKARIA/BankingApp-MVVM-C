//
//  OnlineRoute.swift
//  BankingOnlineRoot
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

import BankingNavigationCore

public enum OnlineRoute: Route {

    case transfer
    case notification
    case profile

    public var navigationType: NavigationType {
        .push
    }
}
