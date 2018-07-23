//
//  CityDetailsEntity.swift
//  LifeLevel
//
//  Created by Александр Чаусов on 24.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import Foundation

class CityDetailsEntity {
    
    let latitude: Double
    let longitude: Double
    let geonameId: Int
    let fullName: String
    let name: String
    let population: Int
    
    init(latitude: Double, longitude: Double, geonameId: Int, fullName: String, name: String, population: Int) {
        self.latitude = latitude
        self.longitude = longitude
        self.geonameId = geonameId
        self.fullName = fullName
        self.name = name
        self.population = population
    }
}
