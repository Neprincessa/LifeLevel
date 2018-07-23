//
//  CityDetailsViewController.swift
//  LifeLevel
//
//  Created by Александр Чаусов on 24.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class CityDetailsViewController: UIViewController {

    fileprivate var details: CityDetailsEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    func configure(with details: CityDetailsEntity) {
        self.details = details
    }
}

private extension CityDetailsViewController {
    
    func configureNavigationBar() {
        title = details?.name
    }
}
