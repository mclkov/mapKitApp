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
        let searchService = SearchService.shared
        guard let query = getQuery() else { return }
        
        searchService.setQuery(query)
        print("search: ", query)
        searchService.findPlaces { (jsonData) in
            print(jsonData)
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
    
    func addPin(_ pin: )
}

