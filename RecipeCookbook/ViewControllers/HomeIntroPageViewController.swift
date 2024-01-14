//
//  HomeIntroPageViewController.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 16/12/23.
//

import UIKit

class HomeIntroPageViewController: UIViewController, StoryboardInstantiate {
    
    //MARK: Variables and Constants
    lazy var homeIntroPageViewModel = {
        return HomeIntroPageViewModel()
    }()
    
    //MARK: View Life cycle methods
    /*
     - viewDidLoad()
     - Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeIntroPageViewController {
    /*
     - homePageButtonClicked(_ sender: UIButton)
     - This method is used to navigate to CategoryViewController
     */
    @IBAction func homePageButtonClicked(_ sender: UIButton) {
        self.homeIntroPageViewModel.loadCategories(self)
    }
}
