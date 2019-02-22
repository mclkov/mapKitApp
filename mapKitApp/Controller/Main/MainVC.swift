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
        print("search")
        let searchService = SearchService.shared
        searchService.setQuery(query: "Arena")
        
        searchService.findPlaces { (jsonData) in
            print(jsonData)
        }
    }
}

