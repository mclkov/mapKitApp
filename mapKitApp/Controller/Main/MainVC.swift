//
//  ViewController.swift
//  mapKitApp
//
//  Created by McL on 2/22/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit
import MapKit

class MainVC: UIViewController {
    let searchBar: UISearchBar = {
        let uiSearchBar = UISearchBar()
        return uiSearchBar
    }()
    
    let mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setupView()
    }
    
    @objc func startSearch() {

    }
    
    func getQuery() -> String? {
        guard let query = searchBar.text else { return nil }
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedQuery == "" {
            return nil
        } else {
            return query
        }
    }
    
    func getPlacePinArray(_ completionHandler: @escaping (_ pins: [PlacePin]) -> Void) {
        let searchService = SearchService.shared
        guard let query = getQuery() else { return }
        
        searchService.setQuery(query)
        print("search: ", query)
        searchService.findPlaces { (jsonData) in
            var pins = [PlacePin]()
            guard let data = jsonData else { return }
            guard let places = data.places else { return }
            
            let placesCount = places.count
            for i in 0..<placesCount {
                let place = places[i]
                let coordinates = self.getCoordinates(coordinatesString: place.coordinates)
            }
        }
    }
    
    func getCoordinates(coordinatesString: Coordinates?) -> CLLocationCoordinate2D? {
        guard let coordinates = coordinatesString else { return nil }
        guard let latitudeString = coordinates.latitude else { return nil }
        guard let longitudeString = coordinates.longitude else { return nil }
        
        return getCoordinatesInDouble(latitude: latitudeString, longitude: longitudeString)
    }
    
    func getCoordinatesInDouble(latitude: String, longitude: String) -> CLLocationCoordinate2D? {
        guard let latitudeDouble = Double(latitude) else { return nil }
        guard let longitudeDouble = Double(longitude) else { return nil }
        
        return CLLocationCoordinate2D(latitude: latitudeDouble, longitude: longitudeDouble)
    }
    
    func addPin(_ pin: PlacePin) {
        
    }
}

