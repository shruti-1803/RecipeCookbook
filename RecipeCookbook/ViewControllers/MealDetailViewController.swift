//
//  MealDetailViewController.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 18/12/23.
//

import UIKit

class MealDetailViewController: UIViewController {
    
    //MARK: Constants and Variables
    var ingredientText: String?
    var mealImageText: String?
    var mealName: String?
    var mealDescriptionText: String?
    
    //MARK: IB outlets
    @IBOutlet weak private var ingredients: UILabel!
    @IBOutlet weak private var mealTitle: UILabel!
    @IBOutlet weak private var mealDescription: UILabel!
    @IBOutlet weak private var mealImageView: UIImageView!
    
    //MARK: View Life Cycle Delegates
    /*
     - viewDidLoad()
     - Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpMealDetailScreen()
    }
    
    /*
     - loadViewIfNeeded()
     - reload the UI for this controller
     */
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
        self.setUpMealDetailScreen()
    }
    
    //MARK: Methods
    /*
     - setUpMealDetailScreen()
     - This method is used to set the UI for this controller
     */
    private func setUpMealDetailScreen() {
        
        guard
            let mealImageText = mealImageText
        else { return }
        
        self.ingredients.text = self.ingredientText
        self.mealImageView.setDownloadedImage(from: mealImageText)
        self.mealTitle.text = self.mealName
        self.mealDescription.text = self.mealDescriptionText
    }
    
}
