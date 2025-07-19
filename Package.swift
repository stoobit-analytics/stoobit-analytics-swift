// swift-tools-version: 5.10.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "stoobit-analytics-swift",
    platforms: [
        .iOS(.v17),
        .tvOS(.v17),
        .macOS(.v14),
        .watchOS(.v10),
        .visionOS(.v1)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Analytics",
            targets: ["Analytics"]),
    ],
    dependencies: [
        .package(url: "https://github.com/stoobit-analytics/stoobit-analytics-swift/", from: "2.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Analytics"
        ),
        .testTarget(
            name: "Analytics Tests",
            dependencies: ["Analytics"],
            path: "Tests"
        )
    ]
)
