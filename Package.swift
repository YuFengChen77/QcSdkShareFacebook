// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "QcSdkShareFacebook", defaultLocalization: "en", platforms: [.iOS(.v17)],

    products: [
        .library(name: "QcSdkShareFacebook", targets: ["QcSdkShareFacebook", "QcSdkShareFacebookSupport"]),
        .library(name: "QcSdkShareFacebookDependencies", type: .dynamic, targets: ["QcSdkShareFacebookDependencies"])
    ],

    dependencies: [
        .package(url: "https://github.com/YuFengChen77/QcSdkCore.git", exact: "2.0.0-beta.1"),
        .package(url: "https://github.com/YuFengChen77/QcSdkShare.git", exact: "2.0.0-beta.1"),
        .package(url: "https://github.com/facebook/facebook-ios-sdk.git", exact: "19.0.0")
    ],

    targets: [
        .binaryTarget(name: "QcSdkShareFacebook", url: "https://github.com/YuFengChen77/QcSdkShareFacebook/releases/download/2.0.0-beta.1/QcSdkShareFacebook-2.0.0-beta.1.xcframework.zip", checksum: "76c9b274efd67f39a97103942703f35d71b9e68d3418638a6f8771f1dbfb64d7"),

        .target(name: "QcSdkShareFacebookSupport", dependencies: ["QcSdkShareFacebook", .product(name: "QcSdkCore", package: "qcsdkcore"), .product(name: "QcSdkShare", package: "qcsdkshare")], path: "QcSdkShareFacebook", exclude: ["DependencySources"], sources: ["Sources"]),
        .target(name: "QcSdkShareFacebookDependencies", dependencies: [.product(name: "FacebookCore", package: "facebook-ios-sdk"), .product(name: "FacebookShare", package: "facebook-ios-sdk")], path: "QcSdkShareFacebook", exclude: ["Sources"], sources: ["DependencySources"])
    ]
)
