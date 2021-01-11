// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "DebugScreen",
    platforms: [.iOS(.v11)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "DebugScreen",
            targets: ["DebugScreen"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        //.package(url: "https://github.com/Alelenka/Device", .revision("df290adc142a10ef73a9b62e9f03e54d1f2f62ee")),
       // .package(url: "https://github.com/surfstudio/iOS-Utils", .revision("b78b1af693be2dd54caabc2cca15dc855075ad8b")),
        .package(name: "Utils", url: "https://github.com/surfstudio/iOS-Utils", .revision("b78b1af693be2dd54caabc2cca15dc855075ad8b"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        //
        .target(name: "DebugScreen", dependencies: ["Utils"]),
    ]
)
