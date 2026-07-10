# HLSDK Swift Package (Binary)

Binary Swift Package Manager distribution of Help Lightning HLSDK for iOS and visionOS.

## Requirements

- iOS 17.0+
- visionOS 2.0+
- Xcode with Swift 6 toolchain

## Products

| Product | Use in |
|---------|--------|
| `HLSDK` | Main app (Objective-C or UIKit integration) |
| `HLSDKSwift` | Main app (Swift / SwiftUI integration) |
| `HLSDKScreenSharing` | ReplayKit broadcast upload extension only |

Link `HLSDKScreenSharing` only on screen-sharing extension targets. Do **not** link it on the main app target.

## Add the package

In Xcode: **File → Add Package Dependencies…**

```
https://github.com/HaleXie/HLSDK-SPM.git
```

Pin an exact release version (for example `0.1.2`) rather than a branch.

## Add `-ObjC` to Other Linker Flags

Every **main app target** that links `HLSDK` or `HLSDKSwift` must add `-ObjC` to **Other Linker Flags**.

The main `HLSDK` XCFramework is a static archive with Objective-C categories. Integrators set this flag on their own targets because Swift Package Manager does not allow remote packages to inject linker flags.

### In Xcode

1. Open your app project in Xcode.
2. Select the **Project** navigator → your project.
3. Under **TARGETS**, select the **app target** that links `HLSDK` or `HLSDKSwift` (not a ReplayKit extension).
4. Open the **Build Settings** tab.
5. Set the filter to **All** and search for `Other Linker Flags`.
6. Double-click **Other Linker Flags** for **Debug** and **Release**.
7. Click **+** and add:
   ```
   -ObjC
   ```
8. Repeat for every app target that links `HLSDK` or `HLSDKSwift` (for example separate iOS and visionOS app targets).

### Which targets need `-ObjC`

| Your target links | Add `-ObjC` |
|-------------------|-------------|
| `HLSDK` | Yes |
| `HLSDKSwift` | Yes |
| `HLSDKScreenSharing` only (ReplayKit extension) | No |

### Verify

In Build Settings, the app target should show:

```
OTHER_LDFLAGS = -ObjC
```

Rebuild and run on simulator or device.

## Typical linking

| Target | Link |
|--------|------|
| SwiftUI app | `HLSDKSwift` |
| UIKit (Swift) app | `HLSDK`, `HLSDKSwift` |
| UIKit (Objective-C) app | `HLSDK` |
| ReplayKit extension | `HLSDKScreenSharing` |

## Imports

```swift
import HLSDK
import HLSDKSwift
import HLSDKScreenSharing // extension targets only
```

```objc
#import <HLSDK/HLSDK.h>
```

## Support

Contact Help Lightning for integration documentation, sample apps, and release notes.
