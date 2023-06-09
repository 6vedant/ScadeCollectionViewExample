// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "CollectionView3",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "CollectionView3",
            type: .static,
            targets: [
                "CollectionView3"
            ]
        )
    ],
    dependencies: [
      .package(name: "ScadeExtensions", url: "https://github.com/scade-platform/ScadeExtensions", .branch("main")),
    ],
    targets: [
        .target(
            name: "CollectionView3",
            dependencies: ["ScadeExtensions"],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)