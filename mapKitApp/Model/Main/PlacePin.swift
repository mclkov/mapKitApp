//
//  PlacePin.swift
//  danske-task
//
//  Created by McL on 12/5/18.
//  Copyright © 2018 McL. All rights reserved.
//

import MapKit

class PlacePin: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let lasts: Double

    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D?, lasts: Double?) {
        self.title = title ?? ""
        self.subtitle = subtitle ?? ""
        self.coordinate = coordinate ?? CLLocationCoordinate2DMake(0.0, 0.0)
        self.lasts = lasts ?? 0.0

        super.init()
    }
}
