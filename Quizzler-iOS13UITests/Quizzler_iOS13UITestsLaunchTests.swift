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
    
    @MainActor
    func testConfirmProgressBarIndicatesQuestionOne() throws {
        app.launch()
        
        confirmProgressBarExists()
        // confirm progress bar shows question 1 of 12
        // How can I make this fluid if the number of questions change
        let currentQuestionNumber: Double = 1
        confirmProgressBarStatus(currentQuestionNumber)
        
    }
    
    @MainActor
    func testTrueAndFalseButtonAdvancesToNextQuestion() throws {
        app.launch()
        confirmTrueButtonExists()
        confirmFalseButtonExists()
        confirmQuestionLabelExists()
        
        var currentQuestionText = getCurrentQuestionText()
        advanceToNextQuestion("True Button")
        var newQuestionText = getCurrentQuestionText()
        XCTAssertNotEqual(currentQuestionText, newQuestionText)
        
        currentQuestionText = newQuestionText
        advanceToNextQuestion("False Button")
        newQuestionText = getCurrentQuestionText()
        XCTAssertNotEqual(currentQuestionText, newQuestionText)
        
        
    }
    
    func confirmScoreLabelExists() {
        let scoreLabel = app.staticTexts["Score: 0"]
        XCTAssertTrue(scoreLabel.exists)
    }
    
    func confirmQuestionLabelExists() {
        let questionLabel = app.staticTexts["questionLabel"]
        
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
    
    func confirmProgressBarStatus(_ currentQuestionNumber: Double) {
        let progressBar = app.progressIndicators["Quiz Question Progress"]
        let currentQuestionDecimal = Double(currentQuestionNumber)/12.0
        let currentQuestionPercentage = round(currentQuestionDecimal * 100)
        
        if let progressPercentage = progressBar.value as? String {
            // Remove % char and convert to Double for comparison
            let progressNumericPercentage = Double(progressPercentage.replacingOccurrences(of: "%", with: "")) ?? 0.0
            
            if progressNumericPercentage == currentQuestionPercentage {
                XCTAssert(true)
            } else {
                XCTFail("Issue found with progress bar status")
            }
        }
    }
    
    func getCurrentQuestionText() -> String {
        
        let questionLabel = app.staticTexts["questionLabel"]
        let questionLabelText = questionLabel.label
        print("\nCurrent Question \(questionLabelText)\n")
        
        return questionLabelText
    }
    
    func advanceToNextQuestion(_ buttonTapped: String) {
        
        switch buttonTapped {
        case "True Button":
            print("\n The True Button was tapped!")
            let trueButton = app.buttons["True"]
            trueButton.tap()
        case "False Button":
            print("\n The False Button was tapped!")
            let falseButton = app.buttons["False"]
            falseButton.tap()
        default:
            print("\n An issue occurred with the button tapped!")
        
        }
    }
    
    
}
