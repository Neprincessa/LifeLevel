//
//  CitiesListViewController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit


class CitiesListViewController: UIViewController {
    
    @IBOutlet fileprivate weak var citiesTableView: UITableView!
    @IBOutlet fileprivate weak var loader: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var infoLabel: UILabel!
    
    fileprivate var citiesArray: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()
        loadCities()
    }

}

private extension CitiesListViewController {
    
    func configureNavigationBar() {
        title = "Список городов"
    }
    
    func configureTableView() {
        citiesTableView.registerNib(cellType: CitiesListTableViewCell.self)
        citiesTableView.rowHeight = UITableViewAutomaticDimension
        citiesTableView.dataSource = self
        citiesTableView.delegate = self
    }
    
    func loadCities() {
        setLoadingState()
        NetworkService.shared.getCitiesList { [weak self] (success, value, error) in
            guard let `self` = self else { return }
            if success, let cities = value {
                self.citiesArray = cities.map { City(nameOfCity: $0.fullName) }
                if self.citiesArray.isEmpty {
                    self.setEmptyState()
                } else {
                    self.citiesTableView.reloadData()
                    self.setNormalState()
                }
            } else {
                self.setErrorState()
            }
        }
    }
}

private extension CitiesListViewController {

    func setLoadingState() {
        citiesTableView.isHidden = true
        loader.isHidden = false
        infoLabel.isHidden = true
        loader.startAnimating()
    }
    
    func setNormalState() {
        citiesTableView.isHidden = false
        loader.isHidden = true
        infoLabel.isHidden = true
        loader.stopAnimating()
    }
    
    func setErrorState() {
        citiesTableView.isHidden = true
        loader.isHidden = true
        infoLabel.isHidden = false
        infoLabel.text = "Упс, возникли проблемы с сервером :("
        loader.stopAnimating()
    }
    
    func setEmptyState() {
        citiesTableView.isHidden = true
        loader.isHidden = true
        infoLabel.isHidden = false
        infoLabel.text = "Данные не найдены"
        loader.stopAnimating()
    }
}

// MARK: - UITableViewDataSource

extension CitiesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CitiesListTableViewCell.identifier, for: indexPath as IndexPath) as? CitiesListTableViewCell else {
            return UITableViewCell()
        }
        let currentCity = citiesArray[indexPath.row]
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

// MARK: - Data

struct City {
    let nameOfCity: String
}
