// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "fast-operators",
  products: [
    .library(
      name: "FastOperators",
      targets: ["FastOperators"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "FastOperators",
      dependencies: []),
    .testTarget(
      name: "FastOperatorsTests",
      dependencies: ["FastOperators"]
    ),
  ]
)
