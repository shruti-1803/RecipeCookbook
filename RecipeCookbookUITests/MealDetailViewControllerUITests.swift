//
//  MealDetailViewControllerUITests.swift
//  RecipeCookbookUITests
//
//  Created by Shruti Mendon on 21/12/23.
//

import XCTest

final class MealDetailViewControllerUITests: XCTestCase {

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
        // Navigate to Meal Detail screen
        let app = XCUIApplication()
        app.buttons["Let's Cook!"].tap()
        app.collectionViews.cells.otherElements.containing(.staticText, identifier:"Chicken").element.tap()
        let teriyakiChickenCasseroleStaticText = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Teriyaki Chicken Casserole"]/*[[".cells.staticTexts[\"Teriyaki Chicken Casserole\"]",".staticTexts[\"Teriyaki Chicken Casserole\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        teriyakiChickenCasseroleStaticText.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.staticTexts["soy sauce - 3/4 cup,\nwater - 1/2 cup,\nbrown sugar - 1/4 cup,\nground ginger - 1/2 teaspoon,\nminced garlic - 1/2 teaspoon,\ncornstarch - 4 Tablespoons,\nchicken breasts - 2,\nstir-fry vegetables - 1 (12 oz.),\nbrown rice - 3 cups"]/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        elementsQuery.staticTexts["Teriyaki Chicken Casserole"].swipeUp()
                                        
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
