//
//  SavedCitiesViewController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class SavedCitiesViewController: UIViewController {

    @IBOutlet weak var savedCitiesTableView: UITableView!
    fileprivate var savedCities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSaved()
        configureCities()
        configureTableView()
    }

}


private extension SavedCitiesViewController {
    func configureSaved() {
        title = "Сохраненные города"
    }
    
    func configureCities() {
        let firstCity = City(nameOfCity: "Russia")
        let secondCity = City(nameOfCity: "Spain")
        savedCities = [firstCity, secondCity, firstCity, secondCity,firstCity, secondCity,firstCity, secondCity, firstCity, secondCity,firstCity, secondCity,firstCity, secondCity,firstCity, secondCity,firstCity, secondCity,firstCity, secondCity]
    }
    
    func configureTableView() {
        savedCitiesTableView.registerNib(cellType: CitiesListTableViewCell.self)
        savedCitiesTableView.rowHeight = UITableViewAutomaticDimension
        savedCitiesTableView.dataSource = self
        savedCitiesTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension SavedCitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CitiesListTableViewCell.identifier, for: indexPath as IndexPath) as? CitiesListTableViewCell else {
            return UITableViewCell()
        }
        let currentCity = savedCities[indexPath.row]
        cell.configure(with: currentCity)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SavedCitiesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CitiesListTableViewCell.estimateHeight
    }
}
