// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BankingDashboard",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BankingDashboard",
            targets: ["BankingDashboard"]
        ),
    ],
    dependencies: [
        .package(
            path: "../../Base/BankingNavigationCore"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BankingDashboard",
            dependencies: [
                .product(
                    name: "BankingNavigationCore",
                    package: "BankingNavigationCore"
                )
            ]
        ),

    ],
    swiftLanguageModes: [.v6]
)
