// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftWechat",
    platforms: [
        .iOS(.v16)
    ],
    targets: [
        .executableTarget(
            name: "SwiftWechat",
            path: "SwiftWechat"
        )
    ]
)
