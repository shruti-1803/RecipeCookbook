//
//  MealDetailViewController.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 18/12/23.
//

import UIKit

protocol MealDetailViewDelegate: AnyObject {
    func setRecipe(_ recipe: Meal)
}

class MealDetailViewController: UIViewController, StoryboardInstantiate {
    
    
    //MARK: Constants and Variables
    private var recipeList: Meal?
    
    lazy var mealDetailViewModel = {
        return MealDetailViewModel()
    }()
    
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
    
    func setMealDetailDelegate() {
        self.mealDetailViewModel.mainCoordinator?.mealDelegate = self
    }
    
    //MARK: Methods
    /*
     - setUpMealDetailScreen()
     - This method is used to set the UI for this controller
     */
    func setUpMealDetailScreen() {
        mealDetailViewModel.loadMealDetails(recipeList) { meal in
            guard
                let imageText = meal.mealImageText
            else { return }
            self.mealTitle.text = meal.mealName
            self.ingredients.text = meal.ingredient
            self.mealImageView.setDownloadedImage(from: imageText)
            self.mealDescription.text = meal.mealDescription
        }
    }
    
}

extension MealDetailViewController: MealDetailViewDelegate {
    
    func setRecipe(_ recipe: Meal) {
        self.recipeList = recipe
    }
}
