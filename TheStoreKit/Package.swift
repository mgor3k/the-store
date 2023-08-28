// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TheStoreKit",
  platforms: [.iOS(.v17)],
  products: [
    .library(
      name: "TheStoreKit",
      targets: ["TheStoreKit"]),
  ],
  targets: [
    .target(
      name: "TheStoreKit"),
    .testTarget(
      name: "TheStoreKitTests",
      dependencies: ["TheStoreKit"]),
  ]
)
