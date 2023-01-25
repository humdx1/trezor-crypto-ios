// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TrezorCrypto",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TrezorCrypto",
            targets: ["TrezorCrypto"]),
    ],
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TrezorCrypto",
            dependencies: ["TrezorCryptoC"]),
        .target(
            name: "TrezorCryptoC",
            cSettings: [
                .define("USE_ETHEREUM", to: "1"),
                .define("RAND_PLATFORM_INDEPENDENT"),
            ]
        ),
        .testTarget(
            name: "TrezorCryptoTests",
            dependencies: ["TrezorCrypto"]),
    ],
    swiftLanguageVersions: [.v5],
    cLanguageStandard: .c99
)
