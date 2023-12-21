//
//  RecipeCookbookNetworkManager.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 17/12/23.
//

import UIKit

class RecipeCookbookNetworkManager {
    //Shared instance of RecipeCookbookNetworkManager
    static let shared = RecipeCookbookNetworkManager()
    
    /*
     - getCategories(completion: @escaping (Result<Categories, NetworkError>)-> Void)
     - This method fetch the categories from the API and handling its error
     */
    func getCategories(completion: @escaping (Result<Categories, NetworkError>)-> Void) {
        RequestHandler.shared.serviceCallFromAPI(Endpoint.categories, completion)
    }
    /*
     - getMealRecipeDetails(mealId: String, completion: @escaping (Result<Meals, NetworkError>) -> Void)
     - This method fetch the meals from the API and handling its error
     */
    func getMealRecipeDetails(mealId: String, completion: @escaping (Result<Meals, NetworkError>) -> Void) {
        RequestHandler.shared.serviceCallFromAPI(Endpoint.recipeDetails, completion)
    }
    
    /*
     - searchMeals(completion: @escaping (Result<Meals, NetworkError>) -> Void)
     - This method fetch the searched meals from the API and handling its error
     */
    func searchMeals(completion: @escaping (Result<Meals, NetworkError>) -> Void) {
        RequestHandler.shared.serviceCallFromAPI(Endpoint.searchMeals, completion)
    }
}
