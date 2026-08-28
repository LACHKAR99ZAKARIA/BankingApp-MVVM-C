//
//  OnlineCoordinator.swift
//  BankingOnlineRoot
//
//  Created by Zakaria Lachkar on 27/8/2026.
//


import SwiftUI
import UIKit
import BankingNavigationCore

public final class OnlineCoordinator:
    NSObject,
    ObservableObject,
    CoordinatorProtocol,
    OnlineRouting,
    UINavigationControllerDelegate {
    @Published var selectedTab: OnlineTab = .home
    
    private let navigationController: UINavigationController
    
    public init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController

        super.init()

        navigationController.delegate = self
    }

    public func navigate(to route: OnlineRoute) {
        switch route.navigationType {
        default:
            push(route)
        }
    }

    public func showTransfer() {
        pushView(Text("transfer"))
    }

    public func showNotification() {
        pushView(Text("showNotification"))
    }

    public func showBeneficiaries() {
        pushView(Text("showBeneficiaries"))
    }

    public func showProfile() {
        pushView(Text("showProfile"))
    }

    public func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }

    private func pushView<Content: View>(
        _ view: Content
    ) {
        let controller = UIHostingController(
            rootView: view
        )

        controller.navigationItem.largeTitleDisplayMode = .never

        navigationController.pushViewController(
            controller,
            animated: true
        )
    }

    public func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool
    ) {
        let isRoot =
            navigationController.viewControllers.first === viewController

        navigationController.setNavigationBarHidden(
            isRoot,
            animated: animated
        )
    }
}

private extension OnlineCoordinator {
    func push(_ route: OnlineRoute) {
        switch route {
        case .transfer:
            showTransfer()
        case .notification:
            showNotification()
        case .profile:
            showProfile()
        }
    }
}
