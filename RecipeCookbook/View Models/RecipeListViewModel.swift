//
//  RecipeListViewModel.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 20/12/23.
//

import Foundation


class RecipeListViewModel {
    
    var recipeListArr: [Meal] = []
    
    func loadMealDetailViewController(_ mealDetailViewController: MealDetailViewController, _ recipeList: Meal) {
        mealDetailViewController.recipeList = recipeList
        
        DispatchQueue.main.async {
            mealDetailViewController.loadViewIfNeeded()
        }
    }
    
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
