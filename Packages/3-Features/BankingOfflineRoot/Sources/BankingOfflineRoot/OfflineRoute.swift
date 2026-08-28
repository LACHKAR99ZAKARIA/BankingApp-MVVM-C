//
//  OfflineRoute.swift
//  BankingOnlineRoot
//
//  Created by Zakaria Lachkar on 27/8/2026.
//

import BankingNavigationCore

public enum OfflineRoute: Route {
    case login
    case register
    case forgotPassword
    
    public var navigationType: NavigationType {
        .push
    }
}
