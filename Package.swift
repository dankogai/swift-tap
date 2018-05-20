// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TAP",
    products: [
        .library(
            name: "TAP",
            targets: ["TAP"]),
    ],
    dependencies: [],
    targets: [
      .target(
        name: "TAP",
        dependencies: []),
      .target(
            name: "Tests",
            dependencies: ["TAP"]),
      //.testTarget(
      //      name: "TAPTests",
      //      dependencies: ["TAP"]),
    ]
)
