//
//  Category.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 17/12/23.
//

import Foundation

//Model for Category
struct Categories: Codable {
    var categories: [CategoryModel]
}

struct CategoryModel: Codable {
    var idCategory: String
    var strCategory: String
    var strCategoryDescription: String
    var strCategoryThumb: String
}
