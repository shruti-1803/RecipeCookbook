//
//  RecipeListViewModel.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 20/12/23.
//

import UIKit

class RecipeListViewModel: CoordinatorBoard {
    
    //MARK: Varibles and Constants
    var mainCoordinator: MainCordinator?
    
    //MARK: Methods
    
    /*
     - searchMealCall(_ completion: @escaping () -> Void)
     - This method is used to call the search meal API and set the variable
     */
    func searchMealCall(_ controller: UIViewController, _ completion: @escaping ([Meal]) -> Void) {
        RecipeCookbookNetworkManager.shared.searchMeals(completion: { result in
            switch result {
            case .success(let meals):
                completion(meals.meals)
            case .failure(_):
                Utility.shared.showAlertView(title: ErrorMessage.title, message: ErrorMessage.message, viewController: controller)
            }
            
        })
    }
    
    func navigateToRecipeDetailsViewController(_ recipe: Meal) {
        self.mainCoordinator?.navigateToMealDetailViewController(recipe)
    }
}
