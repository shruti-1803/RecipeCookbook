//
//  CategoryViewController.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 17/12/23.
//

import UIKit

protocol CategoryViewDelegate: AnyObject {
    func setCategories(_ categories: [CategoryModel])
}

class CategoryViewController: UIViewController, StoryboardInstantiate {
    
    //MARK: Variables and Constants
    private var categoriesArr: [CategoryModel] = []
    
    lazy var categoryViewModel = {
        return CategoryViewModel()
    }()
    
    //MARK: Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK: View life cycle delegates
    /*
     - viewDidLoad()
     - Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCategoryCollectionView()
    }
    
    /*
     - loadCategoryCollectionView()
     - This method is used to register the collection view cell
     */
    private func loadCategoryCollectionView() {
        self.collectionView.register(UINib(nibName: NibName.categoryItem, bundle: nil), forCellWithReuseIdentifier: ReuseCellIdentifier.categoryView)
    }
    
    func setCategoryDelegate() {
        self.categoryViewModel.mainCoordinator?.categoryDelegate = self
    }
}

//MARK: Collection View Data source and Delegates
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    /*
     - collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
     - Returns number of rows as per the count of categories
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoriesArr.count
    }
    
    /*
     - collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
     - Is used to call the specific cell and update its configuration
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseCellIdentifier.categoryView, for: indexPath) as? CategoryView else { return UICollectionViewCell() }
        cell.configure(category: categoriesArr[indexPath.row])
        return cell
    }
    
    /*
     - collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
     - This method is used for navigation to RecipeListViewController
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.categoryViewModel.navigateToRecipeListViewController(id: self.categoriesArr[indexPath.row].idCategory, self)
    }
}

//MARK: Collection View Delegate Flow Layout
extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    
    /*
     - collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
     - Sets the size of the collection view cell programatically
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.categoryViewModel.getCategorySize(view: self.view)
    }
}

extension CategoryViewController: CategoryViewDelegate {
    func setCategories(_ categories: [CategoryModel]) {
        self.categoriesArr = categories
    }
}
