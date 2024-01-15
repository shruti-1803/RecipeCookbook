//
//  HomeIntroPageViewControllerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 21/12/23.
//

import XCTest
@testable import RecipeCookbook

final class HomeIntroPageViewModelTests: XCTestCase {

    var homeIntroPageViewModel: HomeIntroPageViewModel?
    var homeIntroPageViewController: HomeIntroPageViewController?

    override func setUp() {
        super.setUp()
        homeIntroPageViewController = HomeIntroPageViewController()
        homeIntroPageViewModel = HomeIntroPageViewModel()
        homeIntroPageViewModel?.mainCoordinator = MainCordinator()
    }
    
    override func tearDown() {
        homeIntroPageViewModel?.mainCoordinator = nil
        homeIntroPageViewModel = nil
        homeIntroPageViewController = nil
        super.tearDown()
    }
    
    func testFetchCategories() {
        let expectation = self.expectation(description: "Fetch Categories Succesfully")
        homeIntroPageViewModel?.fetchCategories({ result in
            switch result {
            case .success(let categories):
                XCTAssertNotNil(categories)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
                XCTFail(error.localizedDescription)
            }
        })
        self.waitForExpectations(timeout: 10.0)
    }
    
    func testLoadCategories() {
        let expectation = self.expectation(description: "Load Category View Controller Succesfully")
        guard
            let homeIntroPageViewController = homeIntroPageViewController 
        else {
            XCTAssertNil(homeIntroPageViewController)
            return
        }
        XCTAssertNotNil(homeIntroPageViewController)
        homeIntroPageViewModel?.loadCategories(homeIntroPageViewController)
        expectation.fulfill()
        self.waitForExpectations(timeout: 10.0)
    }

}
