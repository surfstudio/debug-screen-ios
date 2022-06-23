// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DebugScreen",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "DebugScreen",
            targets: ["DebugScreen"])
    ],
    targets: [
        .target(
            name: "DebugScreen",
            dependencies: [],
            path: "DebugScreen",
            exclude: [
                "Info.plist"
            ]
        )
    ]
)
