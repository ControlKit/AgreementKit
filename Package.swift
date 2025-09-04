// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AgreementKit",
    platforms: [
         .iOS(.v13)
    ],
    products: [
        .library(
            name: "AgreementKit",
            targets: ["AgreementKit"]
        ),
    ],
    targets: [
        .target(
            name: "AgreementKit",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AgreementKitTests",
            dependencies: ["AgreementKit"]
        ),
    ]
)
