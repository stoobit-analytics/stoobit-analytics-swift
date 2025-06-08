//
//  Test.swift
//  stoobit-analytics-swift
//
//  Created by Till Brügmann on 16.04.25.
//

import Testing
import Foundation
import SystemConfiguration.CaptiveNetwork

@testable import Analytics

struct Test {
    @Test func test() async throws {
        let analytics = Analytics(
            key: "1fafa0f31d10d9725fac48d5f1dbae2e",
            interval: 60,
            debuggingEnabled: true
        )
        
        analytics.track("File Upload", properties: ["filetype": "pages"])
        analytics.flush()
    }
}
