//
//  File.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Foundation
#if os(macOS)
import AppKit
#else
import UIKit
#endif

//extension Analytics {
//    internal func properties() -> [String: Any] {
//#if os(macOS)
//        let osVersion = ProcessInfo.processInfo.operatingSystemVersion
//        let version = "\(osVersion.majorVersion).\(osVersion.minorVersion).\(osVersion.patchVersion)"
//
//        return [
//            "user_id": self.id,
//            "os": "macOS",
//            "os_version": version,
//        ]
//#else
//        return [
//            "user_id": self.id,
//            "os": UIDevice.current.systemName,
//            "os_version": UIDevice.current.systemVersion,
//        ]
//#endif
//    }
//}
