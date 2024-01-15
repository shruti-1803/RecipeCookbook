//
//  MealDetailViewControllerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 21/12/23.
//

import XCTest

@testable import RecipeCookbook

final class MealDetailViewModelTests: XCTestCase {
    
    var mealDetailViewController: MealDetailViewController?
    var mealDetailViewModel: MealDetailViewModel?
    var mockMealDetails = MockMealDetails()
    
    //Mock data
    let mockIngredient = "soy sauce - 3/4 cup,\nwater - 1/2 cup,\nbrown sugar - 1/4 cup,\nground ginger - 1/2 teaspoon,\nminced garlic - 1/2 teaspoon,\ncornstarch - 4 Tablespoons,\nchicken breasts - 2,\nstir-fry vegetables - 1 [12 oz.],\nbrown rice - 3 cups"
    let mockMealName = "Teriyaki Chicken Casserole"
    let mockMealImageText = "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
    let mockMealDescriptionText = "Preheat oven to 350U00b0 F. Spray a 9x13-inch baking pan with non-stick spray.\nCombine soy sauce, U00bd cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\nPlace the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.\n*Meanwhile, steam or cook the vegetables according to package directions.\nAdd the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!"
    
    override func setUp() {
        super.setUp()
        mealDetailViewModel?.mainCoordinator = MainCordinator()
        mealDetailViewModel = MealDetailViewModel()
        mealDetailViewController = MealDetailViewController()
    }
    
    override func tearDown() {
        mealDetailViewModel?.mainCoordinator = nil
        mealDetailViewModel = nil
        mealDetailViewController = nil
        super.tearDown()
    }
    
    func testLoadMealDetails() {
        mealDetailViewModel?.loadMealDetails(mockMealDetails.mockMeal, { [self] (ingredient, mealName, mealDescription, mealImageText) in
            XCTAssertNotNil(ingredient)
            XCTAssertNotNil(mealName)
            XCTAssertNotNil(mealDescription)
            XCTAssertNotNil(mealImageText)
            
            XCTAssertEqual(ingredient, self.mockIngredient)
            XCTAssertEqual(mealName, self.mockMealName)
            XCTAssertEqual(mealDescription, self.mockMealDescriptionText)
            XCTAssertEqual(mealImageText, self.mockMealImageText)
        })
    }
}
