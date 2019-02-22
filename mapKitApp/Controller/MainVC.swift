//
//  ViewController.swift
//  mapKitApp
//
//  Created by McL on 2/22/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit
import MapKit

class MainVC: UIViewController, UISearchBarDelegate {
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // to limit network activity, reload half a second after last key press.
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.startSearch), object: nil)
        self.perform(#selector(self.startSearch), with: nil, afterDelay: 0.5)
    }
    
    @objc func startSearch() {
        print("search")
    }
}

