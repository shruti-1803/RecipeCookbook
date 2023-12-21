//
//  Utility.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 17/12/23.
//

import UIKit

class Utility {
    
    static let shared = Utility()
    let cache = NSCache<NSString, UIImage>()
    
    //This method returns the URL
    func getURL(endpoint: String) -> URL? {
        return URL(string: Endpoint.baseURL + endpoint)
    }
}
