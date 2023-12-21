//
//  CategoryViewModel.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 20/12/23.
//

import Foundation

class CategoryViewModel {
    
    var categories: [Category] = []
    
    //MARK: Methods
    /*
     - fetchCategories()
     - API call is been made in this fucntion to fetch the food categories and update the collection view with the data
     */
    func fetchCategories(completion: @escaping () -> Void) {
        //Add it in protocol
        DispatchQueue.global(qos: .background).async {
            RecipeCookbookNetworkManager.shared.getCategories { result in
                switch result {
                case .success(let categories):
                    self.categories = categories.categories
                    completion()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
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
