//
//  FullScreenLoaderModifier.swift
//  BankingDesignSystem
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import SwiftUI
import UIKit

public struct FullScreenLoaderModifier: ViewModifier {

    let isPresented: Bool

    public func body(content: Content) -> some View {
        content
            .background {
                ControllerReader(
                    isPresented: isPresented
                )
            }
    }

    private struct ControllerReader: UIViewControllerRepresentable {

        let isPresented: Bool

        func makeCoordinator() -> Coordinator {
            Coordinator()
        }

        func makeUIViewController(
            context: Context
        ) -> UIViewController {
            UIViewController()
        }

        func updateUIViewController(
            _ uiViewController: UIViewController,
            context: Context
        ) {
            Task { @MainActor in
                // Permet au UIViewController d'être attaché à la UIWindow
                await Task.yield()

                guard let window = uiViewController.view.window else {
                    return
                }

                if isPresented {
                    context.coordinator.show(
                        in: window,
                        navigationController: uiViewController.navigationController
                    )
                } else {
                    context.coordinator.hide(
                        navigationController: uiViewController.navigationController
                    )
                }
            }
        }

        @MainActor
        final class Coordinator {

            private var hostingController:
                UIHostingController<LoaderView>?

            func show(
                in window: UIWindow,
                navigationController: UINavigationController?
            ) {
                guard hostingController == nil else {
                    return
                }

                let controller = UIHostingController(
                    rootView: LoaderView()
                )

                controller.view.backgroundColor = .clear
                controller.view.frame = window.bounds

                controller.view.autoresizingMask = [
                    .flexibleWidth,
                    .flexibleHeight
                ]

                window.addSubview(controller.view)

                navigationController?
                    .interactivePopGestureRecognizer?
                    .isEnabled = false

                hostingController = controller
            }

            func hide(
                navigationController: UINavigationController?
            ) {
                hostingController?
                    .view
                    .removeFromSuperview()

                hostingController = nil

                navigationController?
                    .interactivePopGestureRecognizer?
                    .isEnabled = true
            }
        }
    }
}
