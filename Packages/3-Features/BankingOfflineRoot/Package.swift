// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BankingOfflineRoot",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BankingOfflineRoot",
            targets: ["BankingOfflineRoot"]
        ),
    ],
    dependencies: [
        .package(
            path: "../../Base/BankingNavigationCore"
        ),
        .package(
            path: "../../Base/BankingSession"
        ),
        .package(
            path: "../../Base/BankingUtilities"
        ),
        .package(
            path: "../../Base/BankingModels"
        ),
        .package(
            path: "../../Infrastructure/BankingDesignSystem"
        ),
        .package(
            path: "../../Infrastructure/BankingNetworking"
        ),
        .package(
            path: "../../Features/BankingDashboard"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BankingOfflineRoot",
            dependencies: [
                .product(
                    name: "BankingNavigationCore",
                    package: "BankingNavigationCore"
                ),
                .product(
                    name: "BankingSession",
                    package: "BankingSession"
                ),
                .product(
                    name: "BankingUtilities",
                    package: "BankingUtilities"
                ),
                .product(
                    name: "BankingModels",
                    package: "BankingModels"
                ),
                .product(
                    name: "BankingDesignSystem",
                    package: "BankingDesignSystem"
                ),
                .product(
                    name: "BankingNetworking",
                    package: "BankingNetworking"
                ),
                .product(
                    name: "BankingDashboard",
                    package: "BankingDashboard"
                )
            ]
        ),

    ],
    swiftLanguageModes: [.v6]
)
