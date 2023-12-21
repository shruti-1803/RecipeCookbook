//
//  UIImageView+Extensions.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 21/12/23.
//

import UIKit

extension UIImageView {
    
    /*
     - setDownloadedImage(from urlString: String)
     - This method is used here to download the image from the URL and set the image of the imageview
     */
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
