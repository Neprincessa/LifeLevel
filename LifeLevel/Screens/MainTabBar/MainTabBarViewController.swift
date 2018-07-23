//
//  MainTabBarViewController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    let layer = CAGradientLayer() //subclass of CALayer

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
        configureTabBarColor()
       // setGradientTabBar()
    }
}

//MARK: - Extansions
private extension MainTabBarViewController {
    
    func configureTabs() {
        let citiesList = CitiesListViewController()
        let searchCities = SearchCitiesViewController()
        let savedCities = SavedCitiesViewController()
        
        let citiesListNC = LLNavigationController(rootViewController: citiesList)
        let searchCitiesNC = LLNavigationController(rootViewController: searchCities)
        let savedCitiesNC = LLNavigationController(rootViewController: savedCities)
        
//      let citiesListItem = UITabBarItem(title: "Список", image: UIImage(named: "citiesTabBar"), tag: 4)
        let citiesListItem = UITabBarItem(title: "Список", image: UIImage(named: "citiesListTabBar"), tag: 4)
        citiesListItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        citiesListNC.tabBarItem = citiesListItem
        
        //searchCitiesNC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        let searchItem = UITabBarItem(title: "Поиск", image: UIImage(named: "searchTabBar"), tag: 5)
        searchItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        searchCitiesNC.tabBarItem = searchItem
        
        let savedItems = UITabBarItem(title: "Сохраненное", image: UIImage(named: "savedTabBar"), tag: 6)
        savedItems.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        savedCitiesNC.tabBarItem = savedItems
      //  savedCitiesNC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        
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


// MARK: - Data

struct City {
    let nameOfCity: String
}
