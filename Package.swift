// swift-tools-version:5.1
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
