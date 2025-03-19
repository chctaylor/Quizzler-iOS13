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
        // Changing to false to only test in one orientation
        false
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    let app = XCUIApplication()

    // Test Case: 1
    @MainActor
    func testLaunch() throws {
        
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
        /*
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
         */
        
    }
    
    @MainActor
    func testConfirmLaunchUIElements() throws {
        
        app.launch()
        
        confirmScoreLabelExists()
        confirmQuestionLabelExists()
        confirmTrueButtonExists()
        confirmFalseButtonExists()
        confirmProgressBarExists()
    }
    
    func confirmScoreLabelExists() {
        let scoreLabel = app.staticTexts["Score: 0"]
        XCTAssertTrue(scoreLabel.exists)
    }
    
    func confirmQuestionLabelExists() {
        let questionLabel = app.staticTexts["questionLabel"]
        
        let questionLabelText = questionLabel.label
        print("Current Question \(questionLabelText)")
        
        XCTAssertTrue(questionLabel.exists)
    }
    
    func confirmTrueButtonExists() {
        let trueButton = app.buttons["True"]
        XCTAssertTrue(trueButton.exists)
    }
    
    func confirmFalseButtonExists() {
        let falseButton = app.buttons["False"]
        XCTAssertTrue(falseButton.exists)
        
    }
    
    func confirmProgressBarExists() {
        let progressBar = app.progressIndicators["Quiz Question Progress"]
        XCTAssertTrue(progressBar.exists)
    }
}
