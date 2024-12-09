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
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "TXLiteAVSDK_Live",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.2/live/TXLiteAVSDK_Live.xcframework.zip",
            checksum: "5c8dd0898bdbd8cedd0db7d01fae28d65c2fdd89f6e45db6238270ce07074854"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.2/live/TXFFmpeg.xcframework.zip",
            checksum: "8ef48e4c90120399353ae687feae4e02d155a43c03fb639063efc4b0e493c27e"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.2/live/TXSoundTouch.xcframework.zip",
            checksum: "91a18e794851a422a8082baed962ac4c11fa95c119ffcc920a0343933bc9ebf5"
        ),.target(
            name: "Live_SwiftPM",
            dependencies: [
                .target(name: "TXLiteAVSDK_Live"),
                .target(name: "TXFFmpeg"),
                .target(name: "TXSoundTouch")
            ],
            sources: ["Live_SwiftPM.swift"],
            linkerSettings: [
                .linkedFramework("AVKit"),
                .linkedFramework("GLKit"),
                .linkedFramework("AssetsLibrary"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("AVFoundation"),
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
        )
    ]
)

