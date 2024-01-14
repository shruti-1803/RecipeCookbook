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
        recipeListViewModel?.searchMealCall(recipeListViewController, { meals in
            switch meals {
            case .su:
                <#code#>
            default:
                <#code#>
            }
        })
    }
    
    func getJsonObject() -> Meals? {
        if let filePath = Bundle.main.path(forResource: MockJson.meals, ofType: MockJson.json) {
            guard let data = try? Data(contentsOf: URL(filePath: filePath)) else { return nil }
            let meals = try? JSONDecoder().decode(Meals.self, from: data)
            return meals
        }
        return nil
    }

}
