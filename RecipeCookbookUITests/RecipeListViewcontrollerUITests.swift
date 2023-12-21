//
//  RecipeListViewcontrollerUITests.swift
//  RecipeCookbookUITests
//
//  Created by Shruti Mendon on 21/12/23.
//

import XCTest

final class RecipeListViewcontrollerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testUI() {
        
        //Tap on recipe from the recipe list table
        let app1 = XCUIApplication()
        app1.launch()
        app1.buttons["Let's Cook!"].tap()
        app1.collectionViews.cells.otherElements.containing(.staticText, identifier:"Chicken").element.tap()
        app1.tables/*@START_MENU_TOKEN@*/.staticTexts["Teriyaki Chicken Casserole"]/*[[".cells.staticTexts[\"Teriyaki Chicken Casserole\"]",".staticTexts[\"Teriyaki Chicken Casserole\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //Tap on recipe from the recipe list table
        let app2 = XCUIApplication()
        app2.launch()
        app2.buttons["Let's Cook!"].tap()
        app2.collectionViews.cells.otherElements.containing(.staticText, identifier:"Chicken").element.tap()
        app2.navigationBars["Recipe List"].buttons["Food Recipe"].tap()
        
        // Entering text on search field
        let app3 = XCUIApplication()
        app3.launch()
        app3/*@START_MENU_TOKEN@*/.staticTexts["Let's Cook!"]/*[[".buttons[\"Let's Cook!\"].staticTexts[\"Let's Cook!\"]",".staticTexts[\"Let's Cook!\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app3.collectionViews.cells.otherElements.containing(.staticText, identifier:"Chicken").element.tap()
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .searchField).element.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
