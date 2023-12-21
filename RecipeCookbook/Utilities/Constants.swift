//
//  Constants.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 19/12/23.
//

import Foundation

struct Endpoint {
    static let baseURL = "https://www.themealdb.com/api/json/v1/1/"
    static let categories = "categories.php"
    static let recipeDetails = "lookup.php?i=52772"
    static let searchMeals = "search.php?f=a"
}

struct SegueIdentifier {
    static let mealDetailViewController = "MealDetailViewController"
    static let recipeListViewController = "RecipeListViewController"
    static let categoryViewController = "CategoryViewController"
}

struct ReuseCellIdentifier {
    static let categoryView = "CategoryView"
    static let recipeListCell = "RecipeListCell"
}

struct NibName {
    static let categoryItem = "CategoryItem"
    static let recipeListView = "RecipeListView"
}

struct SizeConstants {
    static let categoryCellSize = 2.5
    static let recipeListRowHeight = 142.0
}
