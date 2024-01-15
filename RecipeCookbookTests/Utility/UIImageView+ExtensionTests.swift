//
//  UIImageView+ExtensionTests.swift
//  RecipeCookbookTests
//
//  Created by Shruti Mendon on 15/01/24.
//

import XCTest
@testable import RecipeCookbook

final class UIImageView_ExtensionTests: XCTestCase {

    let imageView = UIImageView()
    let imageURL = "https://www.themealdb.com/images/category/dessert.png"
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testDownloadedImage() {
        
        let cache = NSCache<NSString, UIImage>()
        Utility.shared.cache.setObject(UIImage(), forKey: NSString(string: self.imageURL))
        
        let expectation = self.expectation(description: "Downloaded Image Successfully")
        
        self.imageView.setDownloadedImage(from: self.imageURL)
        expectation.fulfill()
        self.waitForExpectations(timeout: 10.0)
    }
}


class UtilityTests: XCTestCase {
    
    let mockRecipeCookbook = MockRecipeCookNetworkManager()
    
    func testShowAlert() async {
        let expectation = self.expectation(description: "Load Alert view controller")
        Task {
            await Utility.shared.showAlertView(title: "Error", message: "Message", viewController: UIViewController())
        }
        expectation.fulfill()
        await self.fulfillment(of: [expectation], timeout: 10.0)
    }
    
    func testJsonObject() {
        guard 
            let meals: Meals = Utility.shared.getJsonObject(fileName: MockJson.meals)
        else { return }
        XCTAssertNotNil(meals)
    }
}
