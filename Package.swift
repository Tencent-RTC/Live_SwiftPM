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
            checksum: "a77b0b5f1e2947b747777564099626ec9179bd5d868247e8a20b413cd481c286"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.2/live/TXFFmpeg.xcframework.zip",
            checksum: "bff4c9a8b81409ea7755a9dfcf9107c26e530940fee9fa90f83c9a3b4b36b2d0"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.2/live/TXSoundTouch.xcframework.zip",
            checksum: "26e607cc100f1fc351c442edeba51175845945c4409c4823dd080faaa0783096"
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

