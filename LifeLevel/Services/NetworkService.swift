//
//  NetworkService.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 23.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import Foundation
import Alamofire

typealias CitiesListCompletionHandler = (_ success: Bool, _ value: [CityListEntity]?, _ error: Error?) -> Void
typealias CitiesDetailsdCompletionHandler = (_ success: Bool, _ value: CityDetailsEntity?, _ error: Error?) -> Void

class NetworkService {
    
    static let shared = NetworkService()
    
    func getCitiesList(handler: @escaping CitiesListCompletionHandler) {
        Alamofire.request("https://api.teleport.org/api/cities/", method: .get).responseJSON { response in
            guard response.result.isSuccess else {
                handler(false, nil, response.result.error)
                return
            }
            
            guard let value = response.value as? [String: Any] else {
                handler(false, nil, nil)
                return
            }
            
            guard let embedded = value["_embedded"] as? [String: Any] else {
                handler(false, nil, nil)
                return
            }
            
            guard let cities = embedded["city:search-results"] as? [[String: Any]] else {
                handler(false, nil, nil)
                return
            }
            
            var citiesEntity: [CityListEntity] = []
            for city in cities {
                if let links = city["_links"] as? [String: Any],
                   let cityItem = links["city:item"] as? [String: String],
                   let link = cityItem["href"],
                   let fullName = city["matching_full_name"] as? String {
                    citiesEntity.append(CityListEntity(fullName: fullName, datailLink: link))
                }
            }
            
            handler(true, citiesEntity, nil)
        }
    }
    
    func getCityDetails(with link: String, handler: @escaping CitiesDetailsdCompletionHandler) {
        Alamofire.request(link, method: .get).responseJSON { response in
            guard response.result.isSuccess else {
                handler(false, nil, response.result.error)
                return
            }
            
            guard let value = response.value as? [String: Any] else {
                handler(false, nil, nil)
                return
            }
            
            guard let fullName = value["full_name"] as? String,
                  let name = value["name"] as? String,
                  let geonameId = value["geoname_id"] as? Int,
                  let population = value["population"] as? Int else {
                handler(false, nil, nil)
                return
            }
            
            guard let location = value["location"] as? [String: Any] else {
                handler(false, nil, nil)
                return
            }
            
            guard let positions = location["latlon"] as? [String: Double] else {
                handler(false, nil, nil)
                return
            }
            
            guard let latitude = positions["latitude"],
                  let longitude = positions["longitude"] else {
                handler(false, nil, nil)
                return
            }
            
            let result = CityDetailsEntity(latitude: latitude, longitude: longitude, geonameId: geonameId, fullName: fullName, name: name, population: population)
            
            handler(true, result, nil)
        }
    }
}
