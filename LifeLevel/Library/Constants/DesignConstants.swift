//
//  ColorConstants.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

//MARK: - Constants
struct ColorConstants {
    static let mainColor = UIColor(red: 190/255, green: 50/255, blue: 25/255, alpha: 1)
    static let firstGradientColor =  UIColor(red: 100/255, green: 24/255, blue: 13/255, alpha: 1)
    static let secondGradientColor = UIColor(red: 255/255, green: 110/255, blue: 80/255, alpha: 1)
    static let textLabelsCityDetailsColor = UIColor(red: 80/255, green: 50/255, blue: 50/255, alpha: 1)
}

extension UIImage {
    static let citiesTabBarImage = UIImage(named: "citiesListTabBar")
    static let searchTabBarImage = UIImage(named: "searchTabBar")
    static let savedTabBarImage = UIImage(named: "savedTabBar")
}
