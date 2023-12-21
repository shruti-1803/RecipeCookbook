//
//  CategoryViewModel.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 20/12/23.
//

import Foundation

class CategoryViewModel {
    
    //MARK: Methods
    /*
     - loadRecipeListViewController(_ idCategory: String, _ recipeListViewController: RecipeListViewController)
     - This method is used to fetch the recipe list from the API and load it in the table view.
     */
    func loadRecipeListViewController(_ idCategory: String, _ recipeListViewController: RecipeListViewController) {
        DispatchQueue.global(qos: .background).async {
            RecipeCookbookNetworkManager.shared.getMealRecipeDetails(mealId: idCategory) { result in
                switch result {
                case .success(let meals):
                    recipeListViewController.recipeListArr = meals.meals
                    DispatchQueue.main.async {
                        recipeListViewController.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
                
            }
        }
    }
}
