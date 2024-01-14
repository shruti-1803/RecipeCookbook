//
//  CategoryViewControllerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 21/12/23.
//

import XCTest

@testable import RecipeCookbook

final class CategoryViewModelTests: XCTestCase {
    
    var categoryViewController: CategoryViewController?
    var categoryViewModel: CategoryViewModel?
    //mock data
    let idCategory = "11"
    
    override func setUp() {
        super.setUp()
        categoryViewModel = CategoryViewModel()
        categoryViewModel?.mainCoordinator = MainCordinator()
        categoryViewController = CategoryViewController()
    }
    
    override func tearDown() {
        categoryViewModel?.mainCoordinator = nil
        categoryViewModel = nil
        categoryViewController = nil
        super.tearDown()
    }
    
    func testLoadRecipeListViewController() {
        let expectation = self.expectation(description: "Fetch Recipe List Succesfully")
        categoryViewModel?.loadRecipeListViewController(idCategory, { result in
            switch result {
            case .success(let meals):
                XCTAssertNotNil(meals)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
                XCTFail(error.localizedDescription)
            }
        })
        self.waitForExpectations(timeout: 10.0)
    }
    
    func testNavigateToRecipeListViewController() {
        guard
            let categoryViewController = categoryViewController
        else {
            XCTAssertNil(categoryViewController)
            return
        }
        XCTAssertNotNil(categoryViewController)
        
        let expectation = self.expectation(description: "Load Recipe List View Controller succesfully")
        categoryViewModel?.navigateToRecipeListViewController(id: idCategory, categoryViewController)
        expectation.fulfill()
        self.waitForExpectations(timeout: 10.0)
    }
    
    func testGetCategorySize() {
        let view = UIView()
        XCTAssertNotNil(categoryViewModel?.getCategorySize(view: view))
    }
}
