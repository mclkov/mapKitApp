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
        removeAllPins()
        getPlacePinArray { (pins) in
            let pinsCount = pins.count
            for i in 0..<pinsCount {
                self.addPin(pins[i])
            }
        }
    }
    
    func getPlacePinArray(_ completionHandler: @escaping (_ pins: [PlacePin]) -> Void) {
        let searchService = SearchService.shared
        guard let query = getQuery() else { return }
        searchService.setQuery(query)
        
        searchService.findPlaces { (jsonData) in
            var pins = [PlacePin]()
            guard let data = jsonData else { return }
            guard let places = data.places else { return }
            
            let placesCount = places.count
            for i in 0..<placesCount {
                let place = places[i]
                if let coordinatesString = place.coordinates {
                    let coordinates = coordinatesString.getCoordinates()
                    pins.append(PlacePin(title: place.name, subtitle: place.type, coordinate: coordinates))
                }
            }
            completionHandler(pins)
        }
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
    
    func addPin(_ pin: PlacePin) {
        DispatchQueue.main.async {
            self.mapView.addAnnotation(pin)
        }
    }
    
    func removeAllPins() {
        self.mapView.removeAnnotations(self.mapView.annotations)
    }
}

