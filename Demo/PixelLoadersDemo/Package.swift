// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "PixelLoadersDemo",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(path: "../.."),
    ],
    targets: [
        .executableTarget(
            name: "PixelLoadersDemo",
            dependencies: [
                .product(name: "PixelLoaders", package: "PixelLoaders"),
            ]
        ),
    ]
)
