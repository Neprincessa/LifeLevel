//
//  LLNavigationController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class LLNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

}

//MARK: - Extensions

private extension LLNavigationController {
    
    func configureAppearance() {
        navigationBar.tintColor = UIColor.white
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationBar.barStyle = .black
        setNavigationBarColor()
    }
    
    func  setNavigationBarColor(){
        var colors = [ColorConstants.firstGradientColor, ColorConstants.secondGradientColor]
        navigationBar.setGradientBackground(colors: colors)
    }
}

extension LLNavigationController {
    func configureTabBarItems(title: String, image: UIImage, tag: Int) {
        let tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        self.tabBarItem = tabBarItem
    }
}

