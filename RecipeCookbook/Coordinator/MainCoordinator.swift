//
//  MainCoordinator.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 12/01/24.
//

import UIKit

protocol ViewControllerDelegate {
    var categoryDelegate: CategoryViewDelegate? { get set }
    var recipeListDelegate: RecipeListViewDelegate? { get set }
    var mealDelegate: MealDetailViewDelegate? { get set }
}

class MainCordinator: StoryboardInstantiate, Coordinator, ViewControllerDelegate {
    
    var navigationController = UINavigationController()
    var categoryDelegate: CategoryViewDelegate?
    var recipeListDelegate: RecipeListViewDelegate?
    var mealDelegate: MealDetailViewDelegate?
    
    func startCoordinator() {
        DispatchQueue.main.async {
            let initialViewController = HomeIntroPageViewController.instantiateFromStoryboard(name: Storyboard.main)
            let homeIntroPageViewModel = HomeIntroPageViewModel()
            homeIntroPageViewModel.mainCoordinator = self
            initialViewController.homeIntroPageViewModel = homeIntroPageViewModel
            self.navigationController.pushViewController(initialViewController, animated: false)
        }
    }
    
    func navigateToCategoryViewController(_ categories: [Category]) {
        DispatchQueue.main.async {
            let categoryViewController = CategoryViewController.instantiateFromStoryboard(name: Storyboard.main)
            let categoryViewModel = CategoryViewModel()
            categoryViewModel.mainCoordinator = self
            categoryViewController.categoryViewModel = categoryViewModel
            categoryViewController.setCategoryDelegate()
            self.categoryDelegate?.setCategories(categories)
            self.navigationController.pushViewController(categoryViewController, animated: false)
        }
    }
    
    func navigateToRecipeListViewController(_ meals: [Meal]) {
        DispatchQueue.main.async {
            let recipeListViewController = RecipeListViewController.instantiateFromStoryboard(name: Storyboard.recipe)
            let recipeListViewModel = RecipeListViewModel()
            recipeListViewModel.mainCoordinator = self
            recipeListViewController.recipeListViewModel = recipeListViewModel
            recipeListViewController.setRecipeListDelegate()
            self.recipeListDelegate?.setRecipeList(meals)
            self.navigationController.pushViewController(recipeListViewController, animated: false)
        }
    }
    
    func navigateToMealDetailViewController(_ recipe: Meal) {
        DispatchQueue.main.async {
            let mealDetailViewController = MealDetailViewController.instantiateFromStoryboard(name: Storyboard.recipe)
            let mealDetailViewModel = MealDetailViewModel()
            mealDetailViewModel.mainCoordinator = self
            mealDetailViewController.mealDetailViewModel = mealDetailViewModel
            mealDetailViewController.setMealDetailDelegate()
            self.mealDelegate?.setRecipe(recipe)
            self.navigationController.pushViewController(mealDetailViewController, animated: false)
        }
    }
}
