//
//  RecipeListCell.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 19/12/23.
//

import UIKit

class RecipeListCell: UITableViewCell {
    
    var rowColor: [UIColor] = [
        UIColor(red: 255/255, green: 240/255, blue: 147/255, alpha: 1),
        UIColor(red: 194/255, green: 241/255, blue: 128/255, alpha: 1)]
    
    @IBOutlet weak var recipeListCellContainer: UIView!
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
//        self.recipeListCellContainer.backgroundColor = .clear
    }
    
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
