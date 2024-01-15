//
//  RecipeListViewControllerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 15/01/24.
//

import XCTest
@testable import RecipeCookbook

final class RecipeListViewControllerTests: XCTestCase {

    var recipeListViewController: RecipeListViewController?
    let recipeListViewModel = RecipeListViewModel()
    
    override func setUp() {
        super.setUp()
        recipeListViewController = RecipeListViewController()
        recipeListViewController?.recipeListViewModel = recipeListViewModel
    }
    
    override func tearDown() {
        recipeListViewController = nil
        super.tearDown()
    }
    
    func testViewController() {
        XCTAssertNotNil(recipeListViewController)
        XCTAssertNotNil(recipeListViewController?.recipeListViewModel)
    }
}
