//
//  CategoryViewTest.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 15/01/24.
//

import XCTest
@testable import RecipeCookbook

final class CategoryViewTest: XCTestCase {
    
    var categoryView: CategoryView?
    
    var mockCategory: CategoryModel? = {
        let mockRecipeCookbook = MockRecipeCookNetworkManager()
        guard let category = mockRecipeCookbook.mockCategories?.categories.first else { return nil }
        return category
    }()
    
    override func setUp() {
        categoryView = CategoryView()
        super.setUp()
    }
    
    override func tearDown() {
        categoryView = nil
        super.tearDown()
    }
    
    func testSetUpCategory() {
        XCTAssertNotNil(categoryView)
        XCTAssertNil(categoryView?.categoryName)
        XCTAssertNil(categoryView?.imageView)
    }
}
