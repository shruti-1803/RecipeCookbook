//
//  CategoryViewModel.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 20/12/23.
//

import UIKit

class CategoryViewModel: CoordinatorBoard {
    
    var mainCoordinator: MainCordinator?
    
    //MARK: Methods
    /*
     - loadRecipeListViewController(_ idCategory: String, _ recipeListViewController: RecipeListViewController)
     - This method is used to fetch the recipe list from the API and load it in the table view.
     */
    func loadRecipeListViewController(_ idCategory: String,_ completion: @escaping (Result<[Meal], NetworkError>) -> Void) {
        RecipeCookbookNetworkManager.shared.getMealRecipeDetails(mealId: idCategory) { result in
            switch result {
            case .success(let meals):
                completion(.success(meals.meals))
            case .failure(_):
                completion(.failure(.badURL))
            }
            
        }
    }
    
    func navigateToRecipeListViewController(id: String,_ controller: UIViewController) {
        self.loadRecipeListViewController(id) { result in
            switch result {
            case .success(let meals):
                self.mainCoordinator?.navigateToRecipeListViewController(meals)
            case .failure(_):
                Utility.shared.showAlertView(title: ErrorMessage.title, message: ErrorMessage.message, viewController: controller)
            }
        }
    }
    
    func getCategorySize(view: UIView) -> CGSize {
        let width = view.frame.width/SizeConstants.categoryCellSize
        return CGSize(width: width, height: width)
    }
}
