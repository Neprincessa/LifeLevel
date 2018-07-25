//
//  CityDetailsViewController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 24.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit
import MapKit


class CityDetailsViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var fullNameData: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var populationData: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    fileprivate var details: CityDetailsEntity?
    fileprivate var cityDetails: [CityDetailsEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCityDetails(for: details!)
        initLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        setMap()
    }

    func configure(with details: CityDetailsEntity) {
        self.details = details
    }
}

//MARK: - Extensions
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
    
    func setMap() {
        
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
    //initLabels()
    }
    
    func initLabels() {
        fullNameLabel.text = "Полное название"
        fullNameLabel.font = UIFont(name: "Ariel", size: 44)
        fullNameLabel.textColor = ColorConstants.textLabelsCityDetailsColor
        populationLabel.text = "Численность населения"
        populationLabel.font = UIFont(name: "Ariel", size: 44)
        populationLabel.textColor = ColorConstants.textLabelsCityDetailsColor
        
        let tmpString = String(details!.population)
        fullNameData.text = details?.fullName
        populationData.text = tmpString
        
        fullNameData.font = UIFont(name: "Ariel", size: 18.0)
        fullNameData.textColor = ColorConstants.textLabelsCityDetailsColor
        populationData.font = UIFont(name: "Ariel", size: 18.0)
        populationData.textColor = ColorConstants.textLabelsCityDetailsColor
    }
}

