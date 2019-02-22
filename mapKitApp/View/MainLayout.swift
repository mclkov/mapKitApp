//
//  MainLayout.swift
//  mapKitApp
//
//  Created by McL on 2/22/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension MainVC {
    func setupView() {
        setupBackground()
        setupSearchBar()
        setupMap()
    }
    
    private func setupBackground() {
        self.view.backgroundColor = .white
    }
    
    private func setupSearchBar() {
        view.insertSubview(searchBar, at: 0)
        setupSearchBarAnchors()
    }
    
    private func setupSearchBarAnchors() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupMap() {
        view.insertSubview(searchBar, at: 0)
        setupMapAnchors()
    }
    
    private func setupMapAnchors() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        mapView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
}
