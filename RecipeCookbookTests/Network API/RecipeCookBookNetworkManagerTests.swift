//
//  RecipeCookBookNetworkManagerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 14/01/24.
//

import XCTest
@testable import RecipeCookbook

final class RecipeCookBookNetworkManagerTests: XCTestCase {
    
    let mockRecipeCookBookNetworkManager = MockRecipeCookNetworkManager()
    
    func testCategoriesResponse() {
        let expectation = self.expectation(description: "Categories Response Parse Expectation")
        mockRecipeCookBookNetworkManager.getCategories { result in
            switch result {
            case .success(let categories):
                XCTAssertNotNil(categories)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
                XCTFail(error.localizedDescription)
            }
        }
        self.waitForExpectations(timeout: 10.0)
    }
    
    func testMealsResponse() {
        let expectation = self.expectation(description: "Meals Response Parse Expectation")
        mockRecipeCookBookNetworkManager.getCategories { result in
            switch result {
            case .success(let meals):
                XCTAssertNotNil(meals)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
                XCTFail(error.localizedDescription)
            }
        }
        self.waitForExpectations(timeout: 10.0)
    }
    
    func testSearchMealsResponse() {
        let expectation = self.expectation(description: "Search Meals Response Parse Expectation")
        mockRecipeCookBookNetworkManager.getCategories { result in
            switch result {
            case .success(let meals):
                XCTAssertNotNil(meals)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
                XCTFail(error.localizedDescription)
            }
        }
        self.waitForExpectations(timeout: 10.0)
    }
}
