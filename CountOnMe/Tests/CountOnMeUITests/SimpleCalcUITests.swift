//
//  SimpleCalcUITests.swift
//  SimpleCalcUITests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest

class SimpleCalcUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddition() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["5"].tap()
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["+"].tap()
        app.buttons["7"].tap()
        app.buttons["+"].tap()
        app.buttons["8"].tap()
        app.buttons["+"].tap()
        app.buttons["9"].tap()
        app.buttons["+"].tap()
        app.buttons["0"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        
        let typeLabel = app.staticTexts["1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 0.5"]
        XCTAssert(typeLabel.exists)
        
        app.buttons["="].tap()
        let resultLabel = app.staticTexts["45.5 = "]
        XCTAssert(resultLabel.exists)
    }
    
    func testMultiplication() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        
        app.buttons["2"].tap()
        app.buttons["x"].tap()
        app.buttons["3"].tap()
        
        let typeLabel = app.staticTexts["2 x 3"]
        XCTAssert(typeLabel.exists)
        app.buttons["="].tap()
        let resultLabel = app.staticTexts["6.0 = "]
        XCTAssert(resultLabel.exists)
    }
    
    func testDivisionFail() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        
        app.buttons["2"].tap()
        app.buttons["/"].tap()
        app.buttons["0"].tap()
        
        let typeLabel = app.staticTexts["2 / 0"]
        XCTAssert(typeLabel.exists)
        app.buttons["="].tap()
        let resultLabel = app.staticTexts["Error = "]
        XCTAssert(resultLabel.exists)
    }

}
