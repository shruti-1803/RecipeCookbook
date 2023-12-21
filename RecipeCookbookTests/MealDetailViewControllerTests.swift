//
//  MealDetailViewControllerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 21/12/23.
//

import XCTest

@testable import RecipeCookbook

final class MealDetailViewControllerTests: XCTestCase {
    
    var mealDetailViewController: MealDetailViewController?
    var mealDetailViewModel: MealDetailViewModel?
    
    override func setUp() {
        super.setUp()
        mealDetailViewModel = MealDetailViewModel()
        if let mealObject = getJsonObject() {
            mealDetailViewController = MealDetailViewController()
            mealDetailViewController?.recipeList = mealObject.meals.first
        }
    }
    
    override func tearDown() {
        super.tearDown()
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
        XCTAssertNotNil(mealDetailViewController)
        XCTAssertNotNil(mealDetailViewController?.recipeList)
        mealDetailViewModel?.loadMealDetails(mealDetailViewController?.recipeList, {
            XCTAssertTrue(true)
            XCTAssertNotNil(self.mealDetailViewModel?.ingredientText)
            XCTAssertNotNil(self.mealDetailViewModel?.mealName)
            XCTAssertNotNil(self.mealDetailViewModel?.mealImageText)
            XCTAssertNotNil(self.mealDetailViewModel?.mealDescriptionText)
            
            //Mock data
            let ingredient = "soy sauce - 3/4 cup,\nwater - 1/2 cup,\nbrown sugar - 1/4 cup,\nground ginger - 1/2 teaspoon,\nminced garlic - 1/2 teaspoon,\ncornstarch - 4 Tablespoons,\nchicken breasts - 2,\nstir-fry vegetables - 1 [12 oz.],\nbrown rice - 3 cups"
            let mealName = "Teriyaki Chicken Casserole"
            let mealImageText = "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
            let mealDescriptionText = "Preheat oven to 350U00b0 F. Spray a 9x13-inch baking pan with non-stick spray.\nCombine soy sauce, U00bd cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\nPlace the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.\n*Meanwhile, steam or cook the vegetables according to package directions.\nAdd the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!"
            
            //Check values
            XCTAssertEqual(self.mealDetailViewModel?.ingredientText, ingredient)
            XCTAssertEqual(self.mealDetailViewModel?.mealName, mealName)
            XCTAssertEqual(self.mealDetailViewModel?.mealImageText, mealImageText)
            XCTAssertEqual(self.mealDetailViewModel?.mealDescriptionText, mealDescriptionText)
        })
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
