//
//  RecipeListCell.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 19/12/23.
//

import UIKit

class RecipeListCell: UITableViewCell {
    
    @IBOutlet weak var mealRecipeName: UILabel!
    @IBOutlet weak var areaName: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mealRecipeName.text = ""
        self.areaName.text = ""
        self.imageView?.image = nil
    }
    
    func setUpRecipeListCell(meal: Meal) {
        
        guard
            let strThumb = meal.strMealThumb
        else { return }
        
        self.mealRecipeName.text = meal.strMeal
        self.areaName.text = meal.strArea
        self.recipeImageView.setDownloadedImage(from: strThumb)
    }
}
