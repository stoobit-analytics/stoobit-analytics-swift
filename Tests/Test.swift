//
//  Test.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Testing
import Foundation
import SystemConfiguration.CaptiveNetwork
import UIKit

@testable import Analytics

func getDeviceIdentifier() -> String {
    var systemInfo = utsname()
    uname(&systemInfo)
    
    let mirror = Mirror(reflecting: systemInfo.machine)
    let identifier = mirror.children.reduce("") { identifier, element in
        guard let value = element.value as? Int8, value != 0 else { return identifier }
        return identifier + String(UnicodeScalar(UInt8(value)))
    }
    
    return identifier
}

struct Test {
    @Test func test() async throws {
        await print("Model:", UIDevice.current.model)
        print("Model Version:", getDeviceIdentifier())
        
        await print("OS:", UIDevice.current.systemName)
        await print("OS Version:", UIDevice.current.systemVersion)
    }
}
