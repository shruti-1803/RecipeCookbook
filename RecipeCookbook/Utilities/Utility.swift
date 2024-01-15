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
    
    func showAlertView(title: String?, message: String?, viewController: UIViewController) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        DispatchQueue.main.async {
            viewController.present(alert, animated: true)
        }
    }
    
    func getJsonObject<T: Decodable>(fileName: String) -> T? {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: MockJson.json) {
            guard let data = try? Data(contentsOf: URL(filePath: filePath)) else { return nil }
            let model = try? JSONDecoder().decode(T.self, from: data)
            return model
        }
        return nil
    }
}
