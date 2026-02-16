// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "PixelLoaders",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "PixelLoaders",
            targets: ["PixelLoaders"]
        ),
    ],
    targets: [
        .target(
            name: "PixelLoaders"
        ),
    ]
)
