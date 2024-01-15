//
//  CategoryViewControllerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 15/01/24.
//

import XCTest
@testable import RecipeCookbook

final class CategoryViewControllerTests: XCTestCase {
    
    var categoryViewController: CategoryViewController?
    let categoryViewModel = CategoryViewModel()
    
    override func setUp() {
        super.setUp()
        categoryViewController = CategoryViewController()
        categoryViewController?.categoryViewModel = categoryViewModel
    }
    
    override func tearDown() {
        categoryViewController = nil
        super.tearDown()
    }
    
    func testViewController() {
        XCTAssertNotNil(categoryViewController)
        XCTAssertNotNil(categoryViewController?.categoryViewModel)
    }
}
