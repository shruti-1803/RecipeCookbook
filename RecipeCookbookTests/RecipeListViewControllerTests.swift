//
//  RecipeListViewControllerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 21/12/23.
//

import XCTest

@testable import RecipeCookbook

final class RecipeListViewControllerTests: XCTestCase {
    
    var recipeListViewController: RecipeListViewController?
    var recipeListViewModel: RecipeListViewModel?

    override func setUp() {
        super.setUp()
        recipeListViewModel = RecipeListViewModel()
        if let mealObject = getJsonObject() {
            recipeListViewController = RecipeListViewController()
            recipeListViewModel?.recipeListArr = mealObject.meals
        }
    }
    
    override func tearDown() {
        super.tearDown()
        recipeListViewModel = nil
        recipeListViewController = nil
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testController() {
        XCTAssertNotNil(recipeListViewController)
        XCTAssertNotNil(recipeListViewController?.recipeListArr)
    }
    
    func testServiceCall() {
        guard let recipe = recipeListViewController?.recipeListArr.first else { return }
        XCTAssertNotNil(recipeListViewModel?.loadMealDetailViewController(MealDetailViewController(), recipe))
        
        recipeListViewModel?.searchMealCall {
            XCTAssertTrue(true)
        }
        
    }
    
    func getJsonObject() -> Meals? {
        if let filePath = Bundle.main.path(forResource: "Meals", ofType: "json") {
            guard let data = try? Data(contentsOf: URL(filePath: filePath)) else { return nil }
            let meals = try? JSONDecoder().decode(Meals.self, from: data)
            return meals
        }
        return nil
    }

}
