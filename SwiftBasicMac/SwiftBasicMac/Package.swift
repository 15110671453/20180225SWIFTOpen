// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift_linux",
    products: [
        .executable(name: "Swift_linux", targets: ["Swift_linux"]),
        ],
    dependencies: [ ],
    targets: [
        .target(
            name: "Swift_linux",
            dependencies: []),
        ]
)
