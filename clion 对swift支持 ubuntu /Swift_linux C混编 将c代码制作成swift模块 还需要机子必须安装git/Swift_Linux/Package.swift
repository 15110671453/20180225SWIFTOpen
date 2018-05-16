// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift_Linux",
        dependencies: [
            .package(url: "./Sources/CHireds",from: "1.0.0"),
        ],
     targets: [
        .target(name: "Swift_Linux", dependencies: [],path:""),
    ]

)
