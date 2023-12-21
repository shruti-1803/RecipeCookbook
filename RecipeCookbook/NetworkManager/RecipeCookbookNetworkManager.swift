//
//  RecipeCookbookNetworkManager.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 17/12/23.
//

import UIKit

class RecipeCookbookNetworkManager {
    
    static let shared = RecipeCookbookNetworkManager()
    
    func getCategories(completion: @escaping (Result<Categories, NetworkError>)-> Void) {
        RequestHandler.shared.serviceCallFromAPI(Endpoint.categories, completion)
    }
    
    func getMealRecipeDetails(mealId: String, completion: @escaping (Result<Meals, NetworkError>) -> Void) {
        RequestHandler.shared.serviceCallFromAPI(Endpoint.recipeDetails, completion)
    }
    
    func searchMeals(completion: @escaping (Result<Meals, NetworkError>) -> Void) {
        RequestHandler.shared.serviceCallFromAPI(Endpoint.searchMeals, completion)
    }
}
