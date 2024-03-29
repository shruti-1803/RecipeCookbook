//
//  CategoryView.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 17/12/23.
//

import UIKit

class CategoryView: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    /*
     - prepareForReuse()
     - This method is used to reload the collection view cell
     */
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.categoryName.text = ""
    }
    
    /*
     - configure(category: CategoryModel)
     - This method is used to setup the collection view cell
     */
    func configure(category: CategoryModel) {
        self.imageView.setDownloadedImage(from: category.strCategoryThumb)
        self.categoryName.text = category.strCategory
    }
    
}
