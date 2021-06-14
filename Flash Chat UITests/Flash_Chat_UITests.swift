//
//  Flash_Chat_UITests.swift
//  Flash Chat UITests
//
//  Created by Arman Abkar on 6/14/21.
//  Copyright © 2021 Arman Abkar. All rights reserved.
//

import XCTest

class Flash_Chat_UITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testLogin() throws {
        let logInStaticText = app.staticTexts["Log In"]
        logInStaticText.tap()
        logInStaticText.tap()
        
        app.textFields["Write a message..."].tap()
        
        let logOutButton = app.navigationBars["⚡️FlashChat"].buttons["Log Out"]
        logOutButton.tap()
    }

    func testRegister() throws {
        let registerStaticText = app.staticTexts["Register"]
        registerStaticText.tap()
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test4@test.com")
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        registerStaticText.tap()
        
        app.textFields["Write a message..."].tap()
        
        let logOutButton = app.navigationBars["⚡️FlashChat"].buttons["Log Out"]
        logOutButton.tap()
        
        app.terminate()
    }
    
    func testAddMessage() throws {
        let logInStaticText = app.staticTexts["Log In"]
        logInStaticText.tap()
        logInStaticText.tap()
        
        let textField = app.textFields["Write a message..."]
        textField.tap()
        textField.typeText("This is an test message from UITests")
        XCUIApplication().buttons["send"].tap()
        
        let logOutButton = app.navigationBars["⚡️FlashChat"].buttons["Log Out"]
        logOutButton.tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
}
