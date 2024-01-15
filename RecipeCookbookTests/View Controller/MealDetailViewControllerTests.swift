//
//  MealDetailViewControllerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 15/01/24.
//

import XCTest
@testable import RecipeCookbook

final class MealDetailViewControllerTests: XCTestCase {
    
    var mealDetailViewController: MealDetailViewController?
    let mealDetailViewModel = MealDetailViewModel()
    
    override func setUp() {
        super.setUp()
        mealDetailViewController = MealDetailViewController()
        mealDetailViewController?.mealDetailViewModel = mealDetailViewModel
    }
    
    override func tearDown() {
        mealDetailViewController = nil
        super.tearDown()
    }
    
    func testViewController() {
        XCTAssertNotNil(mealDetailViewController)
        XCTAssertNotNil(mealDetailViewController?.mealDetailViewModel)
        
    }
    
    func testSetUpDetailScreen() async {
        let expectation = self.expectation(description: "Setting up Meal detail screen succesfully")
        let task = Task {
            await mealDetailViewController?.setUpMealDetailScreen()
        }
        await task.value
        
        if !task.isCancelled {
            expectation.fulfill()
        } else {
            XCTFail()
        }
        
        await self.fulfillment(of: [expectation], timeout: 10.0)
    }
}
