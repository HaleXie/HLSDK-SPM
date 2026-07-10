// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "HLSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .visionOS(.v2)
    ],
    products: [
        .library(
            name: "HLSDK",
            targets: ["HLSDKProduct"]
        ),
        .library(
            name: "HLSDKSwift",
            targets: ["HLSDKSwiftProduct"]
        ),
        .library(
            name: "HLSDKScreenSharing",
            targets: ["HLSDKScreenSharingProduct"]
        )
    ],
    dependencies: [
        // Pin exact versions matching HLSDK/Package.resolved used to build binary XCFrameworks.
        // Floating .upToNextMajor resolves newer Swift ABIs (e.g. aws-sdk-swift 1.7.x) that do not
        // match symbols referenced from the prebuilt HLSDK static blob.
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.10.2"),
        .package(url: "https://github.com/awslabs/aws-sdk-swift.git", exact: "1.6.31"),
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", .upToNextMajor(from: "3.9.0")),
        .package(url: "https://github.com/ccgus/fmdb.git", .upToNextMajor(from: "2.7.12")),
        .package(url: "https://github.com/VIPAAR/CocoaZ.git", exact: "1.4.2-hl-1"),
        .package(url: "https://github.com/VIPAAR/FXKeychain.git", exact: "1.6.0-hl-1"),
        .package(url: "https://github.com/VIPAAR/InputBarAccessoryView.git", exact: "5.4.0-hl-1"),
        .package(url: "https://github.com/jverdi/JVFloatLabeledTextField.git", .upToNextMajor(from: "1.2.5")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "8.1.4")),
        .package(url: "https://github.com/cbpowell/MarqueeLabel.git", .upToNextMajor(from: "4.5.1")),
        .package(url: "https://github.com/VIPAAR/MessageKit.git", exact: "3.7.0-hl-8"),
        .package(url: "https://github.com/VIPAAR/Parchment.git", exact: "1.7.0-hl-1"),
        .package(url: "https://github.com/VIPAAR/Presentr.git", exact: "1.9.2-hl-1"),
        .package(url: "https://github.com/google/promises.git", .upToNextMajor(from: "2.4.0")),
        .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "20.0.4")),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", .upToNextMajor(from: "5.21.2")),
        .package(url: "https://github.com/Juanpe/SkeletonView.git", .upToNextMajor(from: "1.31.0")),
        .package(url: "https://github.com/VIPAAR/SVGKit.git", exact: "3.2.0-hl-1"),
        .package(url: "https://github.com/VIPAAR/SVProgressHUD.git", exact: "2.2.3-hl-2"),
        .package(url: "https://github.com/swiftlang/swift-markdown.git", .upToNextMajor(from: "0.6.0")),
        .package(url: "https://github.com/cesarferreira/SwiftEventBus.git", .upToNextMajor(from: "5.1.0")),
        .package(url: "https://github.com/lucas34/SwiftQueue.git", .upToNextMajor(from: "6.0.2")),
        .package(url: "https://github.com/VIPAAR/SwiftSignatureView.git", exact: "2.2.3-hl-1"),
        .package(url: "https://github.com/VIPAAR/tarkit.git", exact: "0.1.3-hl-1"),
        .package(url: "https://github.com/VIPAAR/tinyspline.git", exact: "1.1.0-hl-1"),
        .package(url: "https://github.com/HaleXie/zoomVideoSDK.git", exact: "2.3.5"),
        .package(url: "https://github.com/opentok/vonage-client-sdk-video.git", exact: "2.27.4"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", .upToNextMajor(from: "0.9.19")),
        .package(url: "https://github.com/VIPAAR/UIActivityIndicator-for-SDWebImage.git", exact: "1.2.0-hl-1")
    ],
    targets: [
        .target(
            name: "HLSDKSwiftProduct",
            dependencies: [
                "HLSDKSwift",
                "HLSDKProduct"
            ],
            path: "Sources/HLSDKSwiftProduct"
        ),
        .target(
            name: "HLSDKScreenSharingProduct",
            dependencies: [
                "HLSDKScreenSharing",
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack")
            ],
            path: "Sources/HLSDKScreenSharingProduct"
        ),
        .target(
            name: "HLSDKProduct",
            dependencies: [
                "HLSDK",
                "HLSDKResources",
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "AWSS3", package: "aws-sdk-swift"),
                .product(name: "AWSTranslate", package: "aws-sdk-swift"),
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack"),
                .product(name: "FMDB", package: "fmdb"),
                .product(name: "FXKeychain", package: "FXKeychain"),
                .product(name: "InputBarAccessoryView", package: "InputBarAccessoryView"),
                .product(name: "JVFloatLabeledTextField", package: "JVFloatLabeledTextField"),
                .product(name: "Kingfisher", package: "Kingfisher"),
                .product(name: "MarqueeLabel", package: "MarqueeLabel"),
                .product(name: "MessageKit", package: "MessageKit"),
                .product(name: "Parchment", package: "Parchment"),
                .product(name: "Presentr", package: "Presentr"),
                .product(name: "Promises", package: "promises"),
                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "SDWebImage", package: "SDWebImage"),
                .product(name: "SkeletonView", package: "SkeletonView"),
                .product(name: "SVGKit", package: "SVGKit"),
                .product(name: "SVProgressHUD", package: "SVProgressHUD"),
                .product(name: "Markdown", package: "swift-markdown"),
                .product(name: "SwiftEventBus", package: "SwiftEventBus"),
                .product(name: "SwiftQueue", package: "SwiftQueue"),
                .product(name: "SwiftSignatureView", package: "SwiftSignatureView"),
                .product(name: "tarkit", package: "tarkit"),
                .product(name: "vipaar-tinyspline", package: "tinyspline"),
                .product(name: "VonageClientSDKVideo", package: "vonage-client-sdk-video", condition: .when(platforms: [.iOS])),
                .product(name: "ZoomVideoSDK-iOS", package: "zoomVideoSDK"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation"),
                .product(name: "UIActivityIndicator-for-SDWebImage", package: "UIActivityIndicator-for-SDWebImage")
            ],
            path: "Sources/HLSDKProduct"
        ),
        .target(
            name: "HLSDKResources",
            path: "Sources/HLSDKResources",
            resources: [
                .process("Resources")
            ]
        ),
        .binaryTarget(name: "HLSDK", url: "https://github.com/HaleXie/HLSDK-SPM/releases/download/0.1.3/HLSDK.xcframework.zip", checksum: "44c1e26d4765c2933576fa3daadc5ed09efec6d5626bd3978bd0dfb01f197f40"),
        .binaryTarget(name: "HLSDKSwift", url: "https://github.com/HaleXie/HLSDK-SPM/releases/download/0.1.3/HLSDKSwift.xcframework.zip", checksum: "17977a425ca386860e6147b40893a4f02ed6f8565b33eb9a64895730e9abc7f9"),
        .binaryTarget(name: "HLSDKScreenSharing", url: "https://github.com/HaleXie/HLSDK-SPM/releases/download/0.1.3/HLSDKScreenSharing.xcframework.zip", checksum: "4711d253ac21c69f3a79af8045f9e9863678129e45008d9858e5d5dd5e7b6010")
    ],
    swiftLanguageModes: [.v5]
)
