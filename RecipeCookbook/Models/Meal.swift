//
//  Meal.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 19/12/23.
//

import UIKit
 
struct Meals: Codable {
    var meals: [Meal]
}

struct Meal: Codable {
    var dateModified : String?
    var idMeal : String?
    var strArea : String?
    var strCategory : String?
    var strCreativeCommonsConfirmed : String?
    var strDrinkAlternate : String?
    var strImageSource : String?
    var strInstructions : String?
    var strMeal: String?
    var strMealThumb : String?
    var strSource : String?
    var strTags : String?
    var strYoutube : String?
    //Recipe Ingredients
    var strIngredient1 : String?
    var strIngredient10 : String?
    var strIngredient11 : String?
    var strIngredient12 : String?
    var strIngredient13 : String?
    var strIngredient14 : String?
    var strIngredient15 : String?
    var strIngredient16 : String?
    var strIngredient17 : String?
    var strIngredient18 : String?
    var strIngredient19 : String?
    var strIngredient2 : String?
    var strIngredient20: String?
    var strIngredient3 : String?
    var strIngredient4 : String?
    var strIngredient5 : String?
    var strIngredient6 : String?
    var strIngredient7 : String?
    var strIngredient8 : String?
    var strIngredient9 : String?
    //Recipe Measurements
    var strMeasure1 : String?
    var strMeasure10 : String?
    var strMeasure11 : String?
    var strMeasure12 : String?
    var strMeasure13 : String?
    var strMeasure14 : String?
    var strMeasure15 : String?
    var strMeasure16 : String?
    var strMeasure17 : String?
    var strMeasure18 : String?
    var strMeasure19 : String?
    var strMeasure2 : String?
    var strMeasure20 : String?
    var strMeasure3 : String?
    var strMeasure4 : String?
    var strMeasure5 : String?
    var strMeasure6 : String?
    var strMeasure7 : String?
    var strMeasure8 : String?
    var strMeasure9 : String?
    
    func getStrIngredientsArr() -> [String?] {
        return[
            strIngredient1,
            strIngredient2,
            strIngredient3,
            strIngredient4,
            strIngredient5,
            strIngredient6,
            strIngredient7,
            strIngredient8,
            strIngredient9,
            strIngredient10,
            strIngredient11,
            strIngredient12,
            strIngredient13,
            strIngredient14,
            strIngredient15,
            strIngredient16,
            strIngredient17,
            strIngredient18,
            strIngredient19,
            strIngredient20]
    }
    
    func getStrMeasures() -> [String?] {
        return [
            strMeasure1,
            strMeasure2,
            strMeasure3,
            strMeasure4,
            strMeasure5,
            strMeasure6,
            strMeasure7,
            strMeasure8,
            strMeasure9,
            strMeasure10,
            strMeasure11,
            strMeasure12,
            strMeasure13,
            strMeasure14,
            strMeasure15,
            strMeasure16,
            strMeasure17,
            strMeasure18,
            strMeasure19,
            strMeasure20]
    }
    
    func getDisplayIngredientsWithMeasures() -> String {
        let ingredients = zip(getStrIngredientsArr(), getStrMeasures())
        return ingredients.compactMap {
            if $0.0 == nil || $0.1 == nil {
                return nil
            } else if $0.0 == "" || $0.1 == "" {
                return nil
            } else {
                return $0.0! + " - " + $0.1!
            }
        }.joined(separator: ",\n")
    }
}

