//
//  HomeIntroPageViewModel.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 21/12/23.
//

import UIKit

class HomeIntroPageViewModel: CoordinatorBoard {
    
    //MARK: Variables and Constants
    var mainCoordinator: MainCordinator?
    
    //MARK: Methods
    /*
     - fetchCategories()
     - API call is been made in this fucntion to fetch the food categories and update the collection view with the data
     */
    func fetchCategories(_ completion: @escaping (Result<[CategoryModel], NetworkError>) -> Void) {
        RecipeCookbookNetworkManager.shared.getCategories { result in
            switch result {
            case .success(let categories):
                completion(.success(categories.categories))
            case .failure(_):
                completion(.failure(.badURL))
            }
        }
    }
    
    func loadCategories(_ controller: UIViewController) {
        self.fetchCategories { result in
            switch result {
            case .success(let categories):
                self.mainCoordinator?.navigateToCategoryViewController(categories)
            case .failure(_):
                Utility.shared.showAlertView(title: ErrorMessage.title, message: ErrorMessage.message, viewController: controller)
            }
        }
    }
}
