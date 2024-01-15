//
//  MainCoordinatorTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 15/01/24.
//

import XCTest
@testable import RecipeCookbook

final class MainCoordinatorTests: XCTestCase {
    
    var mainCoordinator: MainCordinator?
    let mockRecipeCookbook = MockRecipeCookNetworkManager()
    
    override func setUp() {
        super.setUp()
        mainCoordinator = MainCordinator()
    }
    
    override func tearDown() {
        mainCoordinator = nil
        super.tearDown()
    }
    
    func testStartCoordinator() async {
        let expectation = self.expectation(description: "Navigate to Initial View Controller")
        let task = Task {
            mainCoordinator?.startCoordinator()
        }
        await task.value
        if await mainCoordinator?.navigationController.topViewController is HomeIntroPageViewController {
            expectation.fulfill()
        } else {
            XCTFail("Failed to navigate to Intial View Controller")
        }
        await self.fulfillment(of: [expectation], timeout: 10.0)
    }
    
    func testNavigateToCategory() async {
        let expectation = self.expectation(description: "Navigate to Category View Controller")
        guard let categories = mockRecipeCookbook.mockCategories?.categories else { return }
        let task = Task {
            mainCoordinator?.navigateToCategoryViewController(categories)
        }
        await task.value
        if await mainCoordinator?.navigationController.topViewController is CategoryViewController {
            expectation.fulfill()
        } else {
            XCTFail("Failed to navigate to Category View Controller")
        }
        await self.fulfillment(of: [expectation], timeout: 10.0)
    }
    
    func testNavigateToRecipeList() async {
        let expectation = self.expectation(description: "Navigate to Recipe List View Controller")
        guard let meals = mockRecipeCookbook.mockMeals?.meals else { return }
        let task = Task {
            mainCoordinator?.navigateToRecipeListViewController(meals)
        }
        await task.value
        if await mainCoordinator?.navigationController.topViewController is RecipeListViewController {
            expectation.fulfill()
        } else {
            XCTFail("Failed to navigate to Recipe List View Controller")
        }
        await self.fulfillment(of: [expectation], timeout: 10.0)
    }
    
    func testNavigateToMealDetails() async {
        let expectation = self.expectation(description: "Navigate to Meal Detail View Controller")
        guard let meal = mockRecipeCookbook.mockMeals?.meals[0] else { return }
        let task = Task {
            mainCoordinator?.navigateToMealDetailViewController(meal)
        }
        await task.value
        if await mainCoordinator?.navigationController.topViewController is MealDetailViewController {
            expectation.fulfill()
        } else {
            XCTFail("Failed to navigate to Meal Detail View Controller")
        }
        await self.fulfillment(of: [expectation], timeout: 10.0)
    }
}
