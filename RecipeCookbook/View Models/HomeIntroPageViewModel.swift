//
//  HomeIntroPageViewModel.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 21/12/23.
//

import Foundation

class HomeIntroPageViewModel {
    
    //MARK: Variables and Constants
    var categories: [Category] = []
    
    //MARK: Methods
    /*
     - fetchCategories()
     - API call is been made in this fucntion to fetch the food categories and update the collection view with the data
     */
    func fetchCategories(completion: @escaping () -> Void) {
        //Add it in protocol
        DispatchQueue.global(qos: .background).async {
            RecipeCookbookNetworkManager.shared.getCategories { result in
                switch result {
                case .success(let categories):
                    self.categories = categories.categories
                    completion()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
