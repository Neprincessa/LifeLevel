//
//  CityDetailsViewController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 24.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit
import MapKit
//import GoogleMaps

class CityDetailsViewController: UIViewController {
//
//    var mapView: GMSMapView!
//    var london: GMSMarker?
//    var londonView: UIImageView?
//
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cityDetailsTableView: UITableView!
    fileprivate var details: CityDetailsEntity?
    fileprivate var cityDetails: [CityDetailsEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCityDetailsTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        configureTestDetails()
        
        guard let details = details else {
            return
        }
        let cityPosition = CLLocationCoordinate2D(latitude: details.latitude, longitude: details.longitude)
        let camera = MKMapCamera(lookingAtCenter: cityPosition, fromEyeCoordinate: cityPosition, eyeAltitude: 20000)
        mapView.setCamera(camera, animated: false)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = cityPosition
        mapView.addAnnotation(annotation)
    }

    func configure(with details: CityDetailsEntity) {
        self.details = details
    }
}

private extension CityDetailsViewController {
    
    func configureNavigationBar() {
        title = details?.name
        setBackButton()
    }
    
    func setBackButton() {
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icBackButton"),
                                                style: .plain,
                                                target: self,
                                                action: #selector(close))
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc
    func close() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureCityDetailsTableView() {
        cityDetailsTableView.registerNib(cellType: CityDetailsTableViewCell.self)
        cityDetailsTableView.rowHeight = UITableViewAutomaticDimension
//        cityDetailsTableView.dataSource = self
//        cityDetailsTableView.delegate = self
    }
    
    func configureTestDetails() {
        
        var firstCity = CityDetailsEntity(latitude: 365.15, longitude: 5698.6, geonameId: 652, fullName: "Moscow, Russia", name: "Moscow", population: 56)
        
        var secondCity = CityDetailsEntity(latitude: 450.44, longitude: 74.0, geonameId: 11456, fullName: "SaintPetersberg, Russia", name: "SaintPetersberg", population: 1111111111)
        
//        cityDetails = [firstCity, secondCity, firstCity, secondCity, firstCity, secondCity, firstCity, secondCity, firstCity, secondCity]
        cityDetails = [details!]
    }
}

// MARK: - UITableViewDataSource

extension CityDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CityDetailsTableViewCell.identifier, for: indexPath as IndexPath) as? CityDetailsTableViewCell else {
                return UITableViewCell()
            }
            let currentCity = cityDetails[indexPath.row]
            // cell.configure(with: currentCity)
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CityDetailsTableViewCell.identifier, for: indexPath as IndexPath) as? CityDetailsTableViewCell else {
                return UITableViewCell()
            }
            let currentCity = cityDetails[indexPath.row]
            // cell.configure(with: currentCity)
            
            return cell
        }

    }
}

// MARK: - UITableViewDelegate

extension CityDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CityDetailsTableViewCell.estimateHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentCity = cityDetails[indexPath.row]
        loadCityDetails(for: currentCity)
    }
}

private extension CityDetailsViewController {
    //add states
    func loadCityDetails(for city: CityDetailsEntity) {
        NetworkService.shared.getCityDetails(with: city.fullName) { [weak self] (success, value, error) in
            guard let `self` = self else { return }
            if success, let details = value {
                self.showDetailsVC(with: details)
            }
        }
    }
    
    func showDetailsVC(with: CityDetailsEntity) {
          self.details = details.map { CityDetailsEntity(latitude: $0.latitude, longitude: $0.longitude, geonameId: $0.geonameId, fullName: $0.fullName, name: $0.name, population: $0.population) }
    }
}

