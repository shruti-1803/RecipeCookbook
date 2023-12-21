//
//  MealDetailViewModel.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 21/12/23.
//

import Foundation

class MealDetailViewModel {
    
    var ingredientText: String?
    var mealImageText: String?
    var mealName: String?
    var mealDescriptionText: String?
    
    //MARK: Methods
    /*
     - loadMealDetails()
     - This method is used to set the UI for this controller
     */
    func loadMealDetails(_ meal: Meal?, _ completion: @escaping () -> Void) {
        
        guard
            let meal = meal
        else { return }
        
        self.ingredientText = meal.getDisplayIngredientsWithMeasures()
        self.mealName = meal.strMeal
        self.mealDescriptionText = meal.strInstructions
        self.mealImageText = meal.strMealThumb
        completion()
    }
}
