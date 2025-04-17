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

extension Analytics {
    internal static func properties() -> [String: Any] {
#if os(macOS)
        
#else
//        print(UIDevice.current.model)
#endif
        return [:]
    }
}
