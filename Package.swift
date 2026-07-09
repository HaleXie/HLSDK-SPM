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
        .package(url: "https://github.com/VIPAAR/CocoaZ.git", revision: "bbf733a66846cfbb63f0c83ec30fe0114c62de18"),
        .package(url: "https://github.com/VIPAAR/FXKeychain.git", revision: "4b0912036040462a98006d3b03d94fc6e02ddf50"),
        .package(url: "https://github.com/VIPAAR/InputBarAccessoryView.git", revision: "3de95b56aac7dfca0837b792aab47b8f950462b8"),
        .package(url: "https://github.com/jverdi/JVFloatLabeledTextField.git", .upToNextMajor(from: "1.2.5")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "8.1.4")),
        .package(url: "https://github.com/cbpowell/MarqueeLabel.git", .upToNextMajor(from: "4.5.1")),
        .package(url: "https://github.com/VIPAAR/MessageKit.git", revision: "a01f7dda6f4d9105a3eb6c8162d5ff3b3b8c88d2"),
        .package(url: "https://github.com/VIPAAR/Parchment.git", revision: "0ba33e84a115c39cb7c18924a6d51b8624b43998"),
        .package(url: "https://github.com/VIPAAR/Presentr.git", revision: "7da371a453649f20d1f5fac0c92d3c9ec31f8727"),
        .package(url: "https://github.com/google/promises.git", .upToNextMajor(from: "2.4.0")),
        .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "20.0.4")),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", .upToNextMajor(from: "5.21.2")),
        .package(url: "https://github.com/Juanpe/SkeletonView.git", .upToNextMajor(from: "1.31.0")),
        .package(url: "https://github.com/VIPAAR/SVGKit.git", revision: "5220d7d775ffec5df165a1a1bb29a3b74035ca41"),
        .package(url: "https://github.com/VIPAAR/SVProgressHUD.git", revision: "71c48b5ada02edad6268e7dccb54ec3e9ee7b338"),
        .package(url: "https://github.com/swiftlang/swift-markdown.git", .upToNextMajor(from: "0.6.0")),
        .package(url: "https://github.com/cesarferreira/SwiftEventBus.git", .upToNextMajor(from: "5.1.0")),
        .package(url: "https://github.com/lucas34/SwiftQueue.git", .upToNextMajor(from: "6.0.2")),
        .package(url: "https://github.com/VIPAAR/SwiftSignatureView.git", revision: "c3e9e7c3ba898f7cec06f15c811f3e8b8e4c48ea"),
        .package(url: "https://github.com/VIPAAR/tarkit.git", revision: "3e21da024e3b7de508592c0d7637016baea14bea"),
        .package(url: "https://github.com/VIPAAR/tinyspline.git", revision: "e139a80cc841d97a60e0ffdc12d596828161f4c4"),
        .package(url: "https://github.com/zoom/videosdk-ios.git", revision: "82391fbdfe91d6ed227f0d4954d41788a57d958d"),
        .package(url: "https://github.com/opentok/vonage-client-sdk-video.git", exact: "2.27.4"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", .upToNextMajor(from: "0.9.19")),
        .package(url: "https://github.com/VIPAAR/UIActivityIndicator-for-SDWebImage.git", revision: "c882b258922e51ee918e79e330fec7bd986482b0")
    ],
    targets: [
        .target(
            name: "HLSDKSwiftProduct",
            dependencies: [
                "HLSDKSwift",
                "HLSDKProduct"
            ],
            path: "Sources/HLSDKSwiftProduct",
            linkerSettings: [
                .unsafeFlags(["-ObjC"])
            ]
        ),
        .target(
            name: "HLSDKScreenSharingProduct",
            dependencies: [
                "HLSDKScreenSharing",
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack")
            ],
            path: "Sources/HLSDKScreenSharingProduct",
            linkerSettings: [
                .unsafeFlags(["-ObjC"])
            ]
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
                .product(name: "ZoomVideoSDK-iOS", package: "videosdk-ios"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation"),
                .product(name: "UIActivityIndicator-for-SDWebImage", package: "UIActivityIndicator-for-SDWebImage")
            ],
            path: "Sources/HLSDKProduct",
            linkerSettings: [
                // Static XCFrameworks embed Objective-C categories (e.g. FBLPromise+LBTimeout)
                // that are only reachable via dynamic dispatch. Without -ObjC the linker strips
                // those category object files and runtime calls like lbTimeoutOn crash.
                .unsafeFlags(["-ObjC"])
            ]
        ),
        .target(
            name: "HLSDKResources",
            path: "Sources/HLSDKResources",
            resources: [
                .process("Resources")
            ]
        ),
        .binaryTarget(name: "HLSDK", url: "https://github.com/HaleXie/HLSDK-SPM/releases/download/0.1.0/HLSDK.xcframework.zip", checksum: "9df5110a1804174e6d2a809bf31524c658d3c39cc1527f4b77f1fd6cf7b5fee4"),
        .binaryTarget(name: "HLSDKSwift", url: "https://github.com/HaleXie/HLSDK-SPM/releases/download/0.1.0/HLSDKSwift.xcframework.zip", checksum: "0cf24a692a65afe369374b715937ee8d3c86b996c147f7784655827577fa2643"),
        .binaryTarget(name: "HLSDKScreenSharing", url: "https://github.com/HaleXie/HLSDK-SPM/releases/download/0.1.0/HLSDKScreenSharing.xcframework.zip", checksum: "34dca45cbfda7acc63fb35f9170f53c14646cc3b8a81f848064cc2ae4442a1a0")
    ],
    swiftLanguageModes: [.v5]
)
