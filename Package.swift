// swift-tools-version: 6.0.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Live_SwiftPM",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Live_SwiftPM",
            targets: ["Live_SwiftPM"]),
        .library(
            name: "TXLiteAVSDK_ReplayKit",
            targets: ["TXLiteAVSDK_ReplayKitExt"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "TXLiteAVSDK_Live",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/live/13.3.0.20845/TXLiteAVSDK_Live.xcframework.zip",
            checksum: "15322ec7f6c6e7004a21a3aac1f7137b2c01d4f1b35e56676a9983961dc062a4"
        ),
      
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/live/13.3.0.20845/TXFFmpeg.xcframework.zip",
            checksum: "1a28ae7b126e03cab858d883aea79e5f6c91ad6317dc77903e5a4530b3702c2d"
        ),
        .binaryTarget(
            name: "TXLiteAVSDK_ReplayKitExt",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/live/13.3.0.20845/TXLiteAVSDK_ReplayKitExt.xcframework.zip",
            checksum: "ddc2408e7c31adb5b3d02456770ae9f720f278c2c905a0bc7cb4920e57ad15f7"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/live/13.3.0.20845/TXSoundTouch.xcframework.zip",
            checksum: "a9dacccd2658d366fe8097be196349c270be8bea0e68d57c4e2023910d8a7d5e"
        ),.target(
            name: "Live_SwiftPM",
            dependencies: [
                .target(name: "TXLiteAVSDK_Live"),
                .target(name: "TXFFmpeg"),
                .target(name: "TXSoundTouch")
            ],
            sources: ["Live_SwiftPM.swift"],
            linkerSettings: [
                .linkedFramework("ReplayKit"),
                .linkedFramework("VideoToolbox"),
                .linkedFramework("AVKit"),
                .linkedFramework("GLKit"),
                .linkedFramework("AssetsLibrary"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("Accelerate"),
                .linkedFramework("MetalKit"),
                .linkedFramework("MobileCoreServices"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("MetalPerformanceShaders"),
                .linkedLibrary("sqlite3.0"),
                .linkedLibrary("c++"),
                .linkedLibrary("resolv")
            ]
        ),.target(
            name: "TXLiteAVSDK_ReplayKit",
            dependencies: [
                .target(name: "TXLiteAVSDK_ReplayKitExt")
            ],
            sources: ["TXLiteAVSDK_ReplayKitExt.swift"]
        )
    ]
)

