//
//  MockRecipeCookNetworkManager.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 14/01/24.
//

import XCTest
@testable import RecipeCookbook

class MockRecipeCookNetworkManager {
    var shouldReturnError = false
    var isCalledCategoryAPI = false
    var isCalledMealsAPI = false
    var isCalledSearchMealsAPI = false
    
    var mockCategories: Categories? {
        return Utility.shared.getJsonObject(fileName: MockJson.categories)
    }
    
    var mockMeals: Meals? {
        return Utility.shared.getJsonObject(fileName: MockJson.meals)
    }
    
    func reset() {
        shouldReturnError = false
        isCalledCategoryAPI = false
        isCalledMealsAPI = false
        isCalledSearchMealsAPI = false
    }
    
    convenience init() {
        self.init(false)
    }
    
    init(_ shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
}

extension MockRecipeCookNetworkManager: RecipeCookBookNetworkProtocol {
    
    func getCategories(completion: @escaping (Result<RecipeCookbook.Categories, RecipeCookbook.NetworkError>) -> Void) {
        isCalledCategoryAPI = true
        
        if shouldReturnError {
            completion(.failure(.badURL))
        } else {
            guard let categories = mockCategories else { return }
            completion(.success(categories))
        }
    }
    
    func getMealRecipeDetails(mealId: String, completion: @escaping (Result<RecipeCookbook.Meals, RecipeCookbook.NetworkError>) -> Void) {
        isCalledMealsAPI = true
        
        if shouldReturnError {
            completion(.failure(.badURL))
        } else {
            guard let meals = mockMeals else { return }
            completion(.success(meals))
        }
    }
    
    func searchMeals(completion: @escaping (Result<RecipeCookbook.Meals, RecipeCookbook.NetworkError>) -> Void) {
        isCalledSearchMealsAPI = true
        
        if shouldReturnError {
            completion(.failure(.badURL))
        } else {
            guard let meals = mockMeals else { return }
            completion(.success(meals))
        }
    }
}
