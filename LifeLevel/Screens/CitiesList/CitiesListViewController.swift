//
//  CitiesListViewController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit


class CitiesListViewController: UIViewController {
    
    fileprivate var nameOfCity: String = ""
    
    @IBOutlet weak var citiesTableView: UITableView!
    
    fileprivate var citiiiies: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCities()
        configureNavigationBar()
        configureCities()
        configureTableView()
        
        // в метод
        // set loading state
        NetworkService.shared.getCitiesList { [weak self] (success, value, error) in
            guard let `self` = self else { return }
            if success, let cities = value {
                self.citiiiies = cities.map { City(nameOfCity: $0.fullName) }
                if self.citiiiies.isEmpty {
                    // empty state
                } else {
                    self.citiesTableView.reloadData()
                    // set normal state
                }
            } else {
                // set error state
            }
        }
    }

}

private extension CitiesListViewController {
    
    func configureNavigationBar() {
        title = "Список городов"
    }
    
    func configureCities() {
        let firstCity = City(nameOfCity: "Russia")
        let secondCity = City(nameOfCity: "Spain")
        citiiiies = [firstCity, secondCity, firstCity, secondCity,firstCity, secondCity,firstCity, secondCity, firstCity, secondCity,firstCity, secondCity,firstCity, secondCity,firstCity, secondCity,firstCity, secondCity,firstCity, secondCity]
    }
    
    func configureTableView() {
        citiesTableView.registerNib(cellType: CitiesListTableViewCell.self)
        citiesTableView.rowHeight = UITableViewAutomaticDimension
        citiesTableView.dataSource = self
        citiesTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension CitiesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiiiies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CitiesListTableViewCell.identifier, for: indexPath as IndexPath) as? CitiesListTableViewCell else {
            return UITableViewCell()
        }
        let currentCity = citiiiies[indexPath.row]
        cell.configure(with: currentCity)

        return cell
    }
}

// MARK: - UITableViewDelegate

extension CitiesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CitiesListTableViewCell.estimateHeight
    }
}
