//
//  Utility.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 17/12/23.
//

import Foundation
import UIKit

class Utility {
    
    static let shared = Utility()
    fileprivate let cache = NSCache<NSString, UIImage>()
    
    func getURL(endpoint: String) -> URL? {
        return URL(string: Endpoint.baseURL + endpoint)
    }
}

extension UIImageView {
    
    func setDownloadedImage(from urlString: String) {
        //     CHECKING IF IMAGE IS IN CACHE
        let cacheKey = NSString(string: urlString)
        if let cacheImage = Utility.shared.cache.object(forKey: cacheKey) {
            self.image = cacheImage
            return
        }
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global(qos: .background).async {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    error == nil,
                    let response = response as? HTTPURLResponse, response.statusCode == 200,
                    let data = data,
                    let downloadedImage = UIImage(data: data) else {
                    return
                }
                //     PUTTING IMAGE IN CACHE
                Utility.shared.cache.setObject(downloadedImage, forKey: cacheKey)
                DispatchQueue.main.async {
                    self.image = downloadedImage
                }
            }
            task.resume()
        }
    }
}
