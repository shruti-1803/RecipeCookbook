//
//  HomeIntroPageViewController.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 16/12/23.
//

import UIKit

class HomeIntroPageViewController: UIViewController {

    //MARK: Variables and Constants
    lazy private var homeIntroPageViewModel = {
        return HomeIntroPageViewModel()
    }()
    
    //MARK: View Life cycle methods
    /*
     - viewDidLoad()
     - Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /*
     - prepare(for segue: UIStoryboardSegue, sender: Any?)
     - This method is used to set the category array and reload the collection view
     */
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
}

extension HomeIntroPageViewController {
    /*
     - homePageButtonClicked(_ sender: UIButton)
     - This method is used to navigate to CategoryViewController
     */
    @IBAction func homePageButtonClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: SegueIdentifier.categoryViewController, sender: nil)
    }
}
