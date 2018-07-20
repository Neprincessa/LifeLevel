//
//  SearchCitiesViewController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class SearchCitiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearch()
    }
}

private extension SearchCitiesViewController {
    
    func configureSearch() {
        title = "Поиск"
    }
}
