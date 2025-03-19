//
//  Quizzler_iOS13UITestsLaunchTests.swift
//  Quizzler-iOS13UITests
//
//  Created by Chase Taylor on 3/18/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import XCTest

final class Quizzler_iOS13UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
