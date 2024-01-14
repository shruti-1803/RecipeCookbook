//
//  RecipeListViewControllerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 21/12/23.
//

import XCTest

@testable import RecipeCookbook

final class RecipeListViewModelTests: XCTestCase {
    
    var recipeListViewController: RecipeListViewController?
    var recipeListViewModel: RecipeListViewModel?
    let mockMealDetails = MockMealDetails()

    override func setUp() {
        super.setUp()
        recipeListViewController = RecipeListViewController()
        recipeListViewModel = RecipeListViewModel()
        recipeListViewModel?.mainCoordinator = MainCordinator()
    }
    
    override func tearDown() {
        recipeListViewModel?.mainCoordinator = nil
        recipeListViewModel = nil
        recipeListViewController = nil
        super.tearDown()
    }
    
    func testsearchMealCall() {
        guard
            let recipeListViewController = recipeListViewController
        else {
            XCTAssertNil(recipeListViewController)
            return
        }
        XCTAssertNotNil(recipeListViewController)
        let expectation = self.expectation(description: "Fetch searched meals succesfully")
        recipeListViewModel?.searchMealCall(recipeListViewController, { meals in
            XCTAssertNotNil(meals)
            expectation.fulfill()
        })
        self.waitForExpectations(timeout: 10.0)
    }
    
    func testNavigateToRecipeDetailsViewController() {
        guard 
            let mockMeal = mockMealDetails.mockMeal
        else {
            XCTAssertNil(mockMealDetails.mockMeal)
            return
        }
        XCTAssertNotNil(mockMeal)
        let expectation = self.expectation(description: "Load Meal Detail Screen succesfully")
        recipeListViewModel?.navigateToRecipeDetailsViewController(mockMeal)
        expectation.fulfill()
        self.waitForExpectations(timeout: 10.0)
    }
}
