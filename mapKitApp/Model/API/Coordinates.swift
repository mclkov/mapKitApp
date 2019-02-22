//
//  Coordinates.swift
//  danske-task
//
//  Created by McL on 12/5/18.
//  Copyright © 2018 McL. All rights reserved.
//
import MapKit

struct Coordinates: Decodable {
    let latitude: String?
    let longitude: String?
    
    func getCoordinates() -> CLLocationCoordinate2D? {
        guard let latitudeString = latitude else { return nil }
        guard let longitudeString = longitude else { return nil }
        
        return getCoordinatesInDouble(latitude: latitudeString, longitude: longitudeString)
    }
    
    func getCoordinatesInDouble(latitude: String, longitude: String) -> CLLocationCoordinate2D? {
        guard let latitudeDouble = Double(latitude) else { return nil }
        guard let longitudeDouble = Double(longitude) else { return nil }
        
        return CLLocationCoordinate2D(latitude: latitudeDouble, longitude: longitudeDouble)
    }
}
