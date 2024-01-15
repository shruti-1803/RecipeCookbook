//
//  MockMealDetails.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 15/01/24.
//

import XCTest
@testable import RecipeCookbook

class MockMealDetails {
    
    var shouldReturnError = false
    
    var mockMeal: Meal? {
        return Utility.shared.getJsonObject(fileName: MockJson.meal)
    }
    
    init(_ shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    convenience init() {
        self.init(false)
    }
}
