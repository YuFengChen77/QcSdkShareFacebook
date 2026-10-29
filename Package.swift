// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "QcSdkShareFacebook", defaultLocalization: "en", platforms: [.iOS(.v17)],

    products: [
        .library(name: "QcSdkShareFacebook", targets: ["QcSdkShareFacebook", "QcSdkShareFacebookSupport"])
    ],

    dependencies: [
        .package(url: "https://github.com/YuFengChen77/QcSdkCore.git", exact: "1.1.5"),
        .package(url: "https://github.com/YuFengChen77/QcSdkShare.git", exact: "1.1.2"),
        .package(url: "https://github.com/facebook/facebook-ios-sdk.git", exact: "19.0.0")
    ],

    targets: [
        .binaryTarget(name: "QcSdkShareFacebook", url: "https://github.com/YuFengChen77/QcSdkShareFacebook/releases/download/1.1.2/QcSdkShareFacebook-1.1.2.xcframework.zip", checksum: "10df3abd3900270f08b69dcae51631d1eca8d40fe7a04b40c64fb2fd4dbc3e5f"),

        .target(name: "QcSdkShareFacebookSupport", dependencies: ["QcSdkShareFacebook", .product(name: "QcSdkCore", package: "qcsdkcore"), .product(name: "QcSdkShare", package: "qcsdkshare"), .product(name: "FacebookCore", package: "facebook-ios-sdk"), .product(name: "FacebookShare", package: "facebook-ios-sdk")], path: "QcSdkShareFacebook", sources: ["Sources"])
    ]
)
