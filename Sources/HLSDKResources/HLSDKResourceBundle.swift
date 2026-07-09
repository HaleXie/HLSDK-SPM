// HLSDKResourceBundle.swift
// HLSDK
//
// Copyright © 2024 VIPAAR, LLC all rights reserved.

import Foundation

@objc public class HLSDKResourceBundle: NSObject {
    @objc public nonisolated(unsafe) static let shared = HLSDKResourceBundle()
    
    @objc public var bundle: Bundle {
#if HLSDK_SPM
        return Bundle.module
#else
        // This shouldn't be used in CocoaPods builds, but provide fallback
        return Bundle.main
#endif
    }
    
}

