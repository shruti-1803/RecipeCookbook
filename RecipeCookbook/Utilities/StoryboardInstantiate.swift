//
//  StoryboardInstantiate.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 12/01/24.
//

import UIKit

protocol StoryboardInstantiate {
    static func instantiateFromStoryboard(name: String) -> Self
}

extension StoryboardInstantiate {
    static func instantiateFromStoryboard(name: String) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        let id = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
