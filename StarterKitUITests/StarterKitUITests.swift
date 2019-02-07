//
//  StarterKitUITests.swift
//  StarterKitUITests
//
//  Created by Devran Uenal on 07.02.19.
//  Copyright © 2019 Carl Zeiss AG. All rights reserved.
//

import XCTest

class StarterKitUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testScreenshots() {
        snapshot("0Launch")
    }
}
