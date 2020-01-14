// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "Rexy",
  products: [
    .library(name: "Rexy", targets: ["Rexy"])
  ],
  targets: [
    .target(
      name: "Rexy"
    ),
    .testTarget(
      name: "RexyTests",
      dependencies: ["Rexy"]
    )
  ]
)
