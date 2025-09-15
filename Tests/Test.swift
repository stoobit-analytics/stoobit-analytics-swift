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
            key: "82da5f6314d72a14a4f80ca2983a1fe8", debuggingEnabled: true
        )
        analytics.registerForPushNotifications(with: Data(), environment: .testing)
    }
}
