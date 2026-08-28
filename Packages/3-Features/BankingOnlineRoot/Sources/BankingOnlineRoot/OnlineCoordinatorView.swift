//
//  OnlineCoordinatorView.swift
//  BankingOnlineRoot
//
//  Created by Zakaria Lachkar on 27/8/2026.
//


import SwiftUI
import UIKit

public struct OnlineCoordinatorView: UIViewControllerRepresentable {

    public init() {}

    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    public func makeUIViewController(
        context: Context
    ) -> UINavigationController {

        let navigationController = UINavigationController()

        let onlineCoordinator = OnlineCoordinator(
            navigationController: navigationController
        )

        context.coordinator.onlineCoordinator = onlineCoordinator

        let rootView = OnlineRootView(coordinator: onlineCoordinator)

        let hostingController = UIHostingController(
            rootView: rootView
        )

        navigationController.setViewControllers(
            [hostingController],
            animated: false
        )

        return navigationController
    }

    public func updateUIViewController(
        _ uiViewController: UINavigationController,
        context: Context
    ) {}

    public final class Coordinator {
        var onlineCoordinator: OnlineCoordinator?
    }
}
