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

func getPublicIPAddress() async -> String? {
    guard let url = URL(string: "https://api.ipify.org?format=text") else {
        return nil
    }

    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let ip = String(data: data, encoding: .utf8)
        return ip
    } catch {
        print("Failed to fetch IP:", error)
        return nil
    }
}

struct Test {
    @Test func test() async throws {
        print(getDeviceIdentifier()) // iPhone 16
        await print(UIDevice.current.model) // iPhone
        
        await print(UIDevice.current.systemName) // iOS
        await print(UIDevice.current.systemVersion) // 18.1
        
        if let ip = await getPublicIPAddress() {
               print("Public IP: \(ip)")
           } else {
               print("Keine IP erhalten")
           }
    }
}
