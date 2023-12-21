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
     - 
     -
     */
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /*
     -
     -
     */
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.categoryName.text = ""
    }
    
    /*
     -
     -
     */
    func configure(category: Category) {
        self.imageView.setDownloadedImage(from: category.strCategoryThumb)
        self.categoryName.text = category.strCategory
    }
    
}
