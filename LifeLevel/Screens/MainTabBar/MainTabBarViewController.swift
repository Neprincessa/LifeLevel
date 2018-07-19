//
//  MainTabBarViewController.swift
//  LifeLevel
//
//  Created by Александр Чаусов on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }
}

private extension MainTabBarViewController {
    
    func configureTabs() {
        let citiesList = CitiesListViewController()
        let searchCities = SearchCitiesViewController()
        let savedCities = SavedCitiesViewController()
        
        let citiesListNC = UINavigationController(rootViewController: citiesList)
        let searchCitiesNC = UINavigationController(rootViewController: searchCities)
        let savedCitiesNC = UINavigationController(rootViewController: savedCities)
        
        citiesListNC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        searchCitiesNC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        savedCitiesNC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        
        self.viewControllers = [citiesListNC, searchCitiesNC, savedCitiesNC]
    }
    
}
