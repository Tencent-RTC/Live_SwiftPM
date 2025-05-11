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
            url: "https://liteav.sdk.qcloud.com/download/spm/12.4/live/TXLiteAVSDK_Live.xcframework.zip",
            checksum: "8436e716ac1e0692924bc992491ed6c56f9c739361db2a2a554f2340e500ca27"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.4/live/TXFFmpeg.xcframework.zip",
            checksum: "0b175cefc5f1e0a7ab72b8891a28724e4e99be047026d76867c1993e8b8ab574"
        ),
        .binaryTarget(
            name: "TXLiteAVSDK_ReplayKitExt",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.4/professional/TXLiteAVSDK_ReplayKitExt.xcframework.zip",
            checksum: "f9740c8376e21a9acbc674621262074c9eaf0590df7c72b4715d2fde50fb8be6"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.4/live/TXSoundTouch.xcframework.zip",
            checksum: "099b8f1abc8bb87dcbb3d43aabe9334c8e9d5ace1b77818e1fa73ee3ec111301"
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

