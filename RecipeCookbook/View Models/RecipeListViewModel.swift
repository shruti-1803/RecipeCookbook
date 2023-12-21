//
//  RecipeListViewModel.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 20/12/23.
//

import Foundation


class RecipeListViewModel {
    
    //MARK: Varibles and Constants
    var recipeListArr: [Meal] = []
    
    //MARK: Methods
    /*
     - loadMealDetailViewController(_ mealDetailViewController: MealDetailViewController, _ recipeList: Meal)
     - This method is used to set the recipe variable and load the view
     */
    func loadMealDetailViewController(_ mealDetailViewController: MealDetailViewController, _ recipeList: Meal) {
        mealDetailViewController.recipeList = recipeList
        
        DispatchQueue.main.async {
            mealDetailViewController.loadViewIfNeeded()
        }
    }
    
    /*
     - searchMealCall(_ completion: @escaping () -> Void)
     - This method is used to call the search meal API and set the variable
     */
    func searchMealCall(_ completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            RecipeCookbookNetworkManager.shared.searchMeals(completion: { result in
                switch result {
                case .success(let meals):
                    self.recipeListArr = meals.meals
                    completion()
                case .failure(let error):
                    print(error)
                }
                
            })
        }
    }
}
