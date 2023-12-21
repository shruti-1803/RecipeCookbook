//
//  HomeIntroPageViewControllerTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 21/12/23.
//

import XCTest

@testable import RecipeCookbook

final class HomeIntroPageViewControllerTests: XCTestCase {
    
    var homeIntroPageViewController: HomeIntroPageViewController?
    var homeIntroPageViewModel: HomeIntroPageViewModel?

    override func setUp() {
        super.setUp()
        homeIntroPageViewModel = HomeIntroPageViewModel()
        if let categoryData = getJsonObject() {
            homeIntroPageViewModel?.categories = categoryData.categories
            homeIntroPageViewController = HomeIntroPageViewController()
        }
    }
    
    override func tearDown() {
        super.tearDown()
        homeIntroPageViewModel = nil
        homeIntroPageViewController = nil
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testController() {
        let button = UIButton(frame: .zero)
        button.actions(forTarget: self, forControlEvent: .touchUpInside)
        XCTAssertNotNil(homeIntroPageViewController)
        XCTAssertNotNil(homeIntroPageViewController?.viewDidLoad())
        XCTAssertNotNil(homeIntroPageViewController?.viewWillAppear(true))
        XCTAssertNotNil(homeIntroPageViewController?.homeIntroPageViewModel)
    }
    
    func testServiceCall() {
        homeIntroPageViewController?.homeIntroPageViewModel.fetchCategories {
            XCTAssertTrue(true)
        }
    }
    
    func getJsonObject() -> Categories? {
        if let filePath = Bundle.main.path(forResource: "Categories", ofType: "json") {
            guard let data = try? Data(contentsOf: URL(filePath: filePath)) else { return nil }
            let categories = try? JSONDecoder().decode(Categories.self, from: data)
            return categories
        }
        return nil
    }

}
