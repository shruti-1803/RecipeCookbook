//
//  RecipeListCell.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 19/12/23.
//

import UIKit

class RecipeListCell: UITableViewCell {
    
    //MARK: Variables and Constans
    var rowColor: [UIColor] = [
        UIColor(red: 255/255, green: 240/255, blue: 147/255, alpha: 1),
        UIColor(red: 194/255, green: 241/255, blue: 128/255, alpha: 1)]
    
    //MARK: IBOutlets
    @IBOutlet weak var recipeListCellContainer: UIView!
    @IBOutlet weak var mealRecipeName: UILabel!
    @IBOutlet weak var areaName: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    
    /*
     - prepareForReuse()
     - This method is used to reload the table view cell
     */
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mealRecipeName.text = ""
        self.areaName.text = ""
        self.imageView?.image = nil
        self.recipeListCellContainer.backgroundColor = .clear
    }
    
    /*
     - setUpRecipeListCell(meal: Meal,_ indexPathRow: Int)
     - This method is used to set up the table view controller
     */
    func setUpRecipeListCell(meal: Meal,_ indexPathRow: Int) {
        
        guard
            let strThumb = meal.strMealThumb
        else { return }
        
        self.mealRecipeName.text = meal.strMeal
        self.areaName.text = meal.strArea
        self.recipeListCellContainer.backgroundColor = rowColor[indexPathRow%2]
        self.recipeImageView.setDownloadedImage(from: strThumb)
    }
}
