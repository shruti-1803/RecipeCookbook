//
//  Coordinator.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 12/01/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func startCoordinator()
}

protocol CoordinatorBoard {
    var mainCoordinator: MainCordinator? { get set }
}
