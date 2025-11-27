// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = Version("1.40.0")

let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"

enum checksums {
    static let mrtd = "3a018fc7fa3bde4c429c925a02efcdb9b1dad5c0975dc2bf988ca1e3422fef6d"
}

let package = Package(
    name: "IdensicMobileSDK_MRTDReader",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "IdensicMobileSDK_MRTDReader",
            targets: [
                "MRTDReaderWrapper"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SumSubstance/IdensicMobileSDK-iOS.git", .exact(version)),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL", "3.1.5001" ..< "4.0.0"),
        .package(url: "https://github.com/OVD-Kinegram-AG/emrtd-connector-sdk-ios", "2.10.0" ..< "2.11.0")
    ],
    targets: [
        .binaryTarget(
            name: "IdensicMobileSDK_MRTDReader",
            url: "\(gitUrl)/IdensicMobileSDK_MRTDReader-\(version).zip",
            checksum: checksums.mrtd
        ),
        .target(
            name: "MRTDReaderWrapper",
            dependencies: [
                .product(name: "IdensicMobileSDK", package: "IdensicMobileSDK-iOS"),
                "IdensicMobileSDK_MRTDReader",
                "OpenSSL",
                .product(name: "KinegramEmrtdConnector", package: "emrtd-connector-sdk-ios")
            ],
            path: "MRTDReaderWrapper"
        )
    ]
)
