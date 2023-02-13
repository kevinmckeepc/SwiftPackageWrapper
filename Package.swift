// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPackageWrapper",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SwiftPackageWrapper",
            type: .dynamic,
            targets: ["SwiftPackageWrapperTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/xmartlabs/Eureka.git", exact: "5.3.6"),
    ],
    targets: [
        .target(
            name: "SwiftPackageWrapperTarget",
            dependencies: [
                "Eureka",
            ],
            linkerSettings: [
                .linkedFramework("Foundation", .when(platforms: [.iOS])),
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("SwiftUI", .when(platforms: [.iOS])),
            ]
        ),
        .testTarget(
            name: "SwiftPackageWrapperTargetTests",
            dependencies: ["SwiftPackageWrapperTarget"]),
    ]
)
