//
//  CitiesListViewController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }

}

private extension CitiesListViewController {
    
    func configureNavigationBar() {
        title = "Список городов"
    }
}
