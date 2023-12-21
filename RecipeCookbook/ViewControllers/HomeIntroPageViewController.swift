//
//  HomeIntroPageViewController.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 16/12/23.
//

import UIKit

class HomeIntroPageViewController: UIViewController {

    lazy var homeIntroPageViewModel = {
        return HomeIntroPageViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CategoryViewController {
            
            guard
                let categoryViewController = segue.destination as? CategoryViewController
            else { return }
            
            homeIntroPageViewModel.fetchCategories {
                categoryViewController.categoriesArr = self.homeIntroPageViewModel.categories
                DispatchQueue.main.async {
                    categoryViewController.collectionView.reloadData()
                }
            }
        }
    }
    
    @IBAction func homePageButtonClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "CategoryViewController", sender: nil)
    }
    
}

