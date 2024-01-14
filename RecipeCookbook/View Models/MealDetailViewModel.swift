//
//  MealDetailViewModel.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 21/12/23.
//

import Foundation

class MealDetailViewModel: CoordinatorBoard {
    
    var mainCoordinator: MainCordinator?
    
    //MARK: Methods
    /*
     - loadMealDetails()
     - This method is used to set the UI for this controller
     */
    func loadMealDetails(_ meal: Meal?, _ completion: @escaping ((ingredient: String?, mealName: String?, mealDescription: String?, mealImageText: String?)) -> Void) {
        
        guard let meal = meal else { return }
        
        completion((meal.getDisplayIngredientsWithMeasures(), meal.strMeal, meal.strInstructions, meal.strMealThumb))
    }
}
