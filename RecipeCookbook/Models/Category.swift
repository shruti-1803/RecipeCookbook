//
//  Category.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 17/12/23.
//

import Foundation

struct Categories: Codable {
    var categories: [Category]
}

struct Category: Codable {
    var idCategory: String
    var strCategory: String
    var strCategoryDescription: String
    var strCategoryThumb: String
}
