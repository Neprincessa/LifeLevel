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
    @IBOutlet fileprivate weak var loaderView: UIView!
    @IBOutlet fileprivate weak var loader: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var infoLabel: UILabel!
    
    fileprivate var citiesArray: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureTableView()
        configureLoader()
        
        loadCities()
    }

//        func configure(with details: City) {
//            self.details = details
//        }
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
    
    func configureLoader() {
        loaderView.backgroundColor = ColorConstants.mainColor.withAlphaComponent(0.8)
        loaderView.layer.cornerRadius = 15
        loaderView.layer.masksToBounds = true
        loader.activityIndicatorViewStyle = .whiteLarge
    }
}

private extension CitiesListViewController {
    
    func loadCities() {
        setLoadingState()
        NetworkService.shared.getCitiesList { [weak self] (success, value, error) in
            guard let `self` = self else { return }
            if success, let cities = value {
                self.citiesArray = cities.map { City(nameOfCity: $0.fullName, link: $0.datailLink) }
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
    
    func loadDetails(for city: City) {
        showLoader()
        NetworkService.shared.getCityDetails(with: city.link) { [weak self] (success, result, error) in
            guard let `self` = self else { return }
            self.hideLoader()
            if success, let details = result {
                self.openDetailsVC(with: details)
            }
        }
    }
    
    func openDetailsVC(with details: CityDetailsEntity) {
        let detailsVC = CityDetailsViewController()
        detailsVC.configure(with: details)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

private extension CitiesListViewController {

    func setLoadingState() {
        showLoader()
        citiesTableView.isHidden = true
        infoLabel.isHidden = true
    }
    
    func setNormalState() {
        hideLoader()
        citiesTableView.isHidden = false
        infoLabel.isHidden = true
    }
    
    func setErrorState() {
        hideLoader()
        citiesTableView.isHidden = true
        infoLabel.isHidden = false
        infoLabel.text = "Упс, возникли проблемы с сервером :("
    }
    
    func setEmptyState() {
        hideLoader()
        citiesTableView.isHidden = true
        infoLabel.isHidden = false
        infoLabel.text = "Данные не найдены"
    }
    
    func showLoader() {
        loaderView.isHidden = false
        loader.startAnimating()
    }
    
    func hideLoader() {
        loaderView.isHidden = true
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentCity = citiesArray[indexPath.row]
        loadDetails(for: currentCity)
    }
}

// MARK: - Data

struct City {
    let nameOfCity: String
    let link: String
}
