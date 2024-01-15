//
//  RecipeListCellTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 15/01/24.
//

import XCTest
@testable import RecipeCookbook

final class RecipeListCellTests: XCTestCase {

    var recipeListCell: RecipeListCell?
    
    var mockMeals: Meals? = {
        let mockRecipeCookbook = MockRecipeCookNetworkManager()
        return mockRecipeCookbook.mockMeals
    }()
    
    override func setUp() {
        super.setUp()
        recipeListCell = RecipeListCell()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewCell() {
        XCTAssertNotNil(recipeListCell)
        XCTAssertNil(recipeListCell?.areaName)
        XCTAssertNil(recipeListCell?.mealRecipeName)
        XCTAssertNil(recipeListCell?.recipeListCellContainer)
        XCTAssertNil(recipeListCell?.recipeImageView)
    }
}
