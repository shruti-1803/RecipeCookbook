//
//  RecipeListViewController.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 18/12/23.
//

import UIKit

protocol RecipeListViewDelegate: AnyObject {
    func setRecipeList(_ recipes: [Meal])
}

class RecipeListViewController: UIViewController, StoryboardInstantiate {
    
    //MARK: Variable and Constants
    private var recipeListArr: [Meal] = []
    
    lazy var recipeListViewModel = {
        return RecipeListViewModel()
    }()
    
    //MARK: IBOutlets
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!
    
    //MARK: View Life Cycle Methods
    /*
     - viewDidLoad()
     - Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadRecipeListTableView()
    }
    
    fileprivate func loadRecipeListTableView() {
        self.tableView.register(UINib(nibName: NibName.recipeListView, bundle: nil), forCellReuseIdentifier: ReuseCellIdentifier.recipeListCell)
    }
    
    func setRecipeListDelegate() {
        self.recipeListViewModel.mainCoordinator?.recipeListDelegate = self
    }
}

//MARK: Tableview Delegates and Datasources
extension RecipeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    /*
     - tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     - This method is used to return number of rows based on count of recipe list
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipeListArr.count
    }
    
    /*
     - tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     - This method is used to call the specific cell and update its configuration
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let recipeListCell = self.tableView.dequeueReusableCell(withIdentifier: ReuseCellIdentifier.recipeListCell) as? RecipeListCell
        else {
            return RecipeListCell()
        }
        
        recipeListCell.setUpRecipeListCell(meal: self.recipeListArr[indexPath.row], indexPath.row)
        return recipeListCell
    }
    
    /*
     - tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
     - This method is used for navigation to MealDetailViewController
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.recipeListViewModel.navigateToRecipeDetailsViewController(self.recipeListArr[indexPath.row])
    }
    
    /*
     - tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
     - This method is used to set the height of the table view cell
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SizeConstants.recipeListRowHeight
    }
}

//MARK: Search delegates
extension RecipeListViewController: UISearchBarDelegate {
    
    /*
     - searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool
     - This method helps to execute a method when user stops editing in search bar
     */
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    /*
     - searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
     - This method helps to call the search API when user starts searching
     */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.recipeListViewModel.searchMealCall(self) { meals in
            self.recipeListArr = meals
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension RecipeListViewController: RecipeListViewDelegate {
    func setRecipeList(_ recipes: [Meal]) {
        self.recipeListArr = recipes
    }
}
