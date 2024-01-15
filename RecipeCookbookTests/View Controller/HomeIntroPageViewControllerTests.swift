//
//  HomeIntroPageViewControllerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 15/01/24.
//

import XCTest
@testable import RecipeCookbook

final class HomeIntroPageViewControllerTests: XCTestCase {

    var homePageIntroViewController: HomeIntroPageViewController?
    var homePageIntroViewModel = HomeIntroPageViewModel()
    
    override func setUp() {
        super.setUp()
        homePageIntroViewController = HomeIntroPageViewController()
        homePageIntroViewController?.homeIntroPageViewModel = homePageIntroViewModel
    }
    
    override func tearDown() {
        homePageIntroViewController = nil
        super.tearDown()
    }
    
    func testViewController() {
        XCTAssertNotNil(homePageIntroViewController)
        XCTAssertNotNil(homePageIntroViewController?.homeIntroPageViewModel)
    }
    
    func testButtonAction() async {
        let expectation = self.expectation(description: "Navigate to Category View Controller Action")
        let task = Task {
            let button = await UIButton()
            await homePageIntroViewController?.homePageButtonClicked(button)
        }
        await task.value
        if !task.isCancelled {
            expectation.fulfill()
        } else {
            XCTFail("Couldn't navigate to Category View COntroller")
        }
        await self.fulfillment(of: [expectation], timeout: 10.0)
    }
}
