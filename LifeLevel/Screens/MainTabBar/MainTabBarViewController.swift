//
//  MainTabBarViewController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    let layer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
        configureTabBarColor()
       // setGradientTabBar()
    }
}

//MARK: - Extensions
private extension MainTabBarViewController {
    
    func configureTabs() {
        let citiesList = CitiesListViewController()
        let searchCities = SearchCitiesViewController()
        let savedCities = SavedCitiesViewController()
        
        let citiesListNC = LLNavigationController(rootViewController: citiesList)
        let searchCitiesNC = LLNavigationController(rootViewController: searchCities)
        let savedCitiesNC = LLNavigationController(rootViewController: savedCities)
        

        let citiesListItem = citiesListNC.configureTabBarItems(title: "Список", image: UIImage.citiesTabBarImage!, tag: 4)
        let searchItem = searchCitiesNC.configureTabBarItems(title: "Поиск", image: UIImage.searchTabBarImage!, tag: 5)
        let savedItems = savedCitiesNC.configureTabBarItems(title: "Сохраненное", image: UIImage.savedTabBarImage!, tag: 6)
     
        self.viewControllers = [citiesListNC, searchCitiesNC, savedCitiesNC]
    }
    
    func configureTabBarColor() {
        tabBar.unselectedItemTintColor = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
        tabBar.tintColor = UIColor.white
        tabBar.barTintColor = ColorConstants.mainColor
    }
    
    
    //Нужно вертикально!
    func setGradientTabBar() {

        let firstColor = UIColor(red: 100/255, green: 24/255, blue: 13/255, alpha: 1)
        let secondColor = UIColor(red: 255/255, green: 110/255, blue: 80/255, alpha: 1)
       // layer.colors = [UIColor.red.cgColor, UIColor.black.cgColor]
        layer.colors = [firstColor.cgColor, secondColor.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        self.tabBar.layer.addSublayer(layer)
    }
}


