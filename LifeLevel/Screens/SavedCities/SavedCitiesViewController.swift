//
//  SavedCitiesViewController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class SavedCitiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSaved()     
    }

}


private extension SavedCitiesViewController {
    func configureSaved() {
        title = "Сохраненные города"
    }
}
