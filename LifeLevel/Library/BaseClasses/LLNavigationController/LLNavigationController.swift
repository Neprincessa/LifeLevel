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


private extension LLNavigationController {
    
    func configureAppearance() {
        navigationBar.barTintColor = ColorConstants.mainColor
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationBar.barStyle = .black
    }
}
