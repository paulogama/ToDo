//
//  Location.swift
//  ToDo
//
//  Created by Paulo Gama on 06/01/18.
//  Copyright © 2018 Paulo Gama. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

extension Location: Equatable {}

func ==(lhs: Location, rhs: Location) -> Bool {
    if lhs.coordinate?.latitude != rhs.coordinate?.latitude {
        return false
    }
    
    if lhs.coordinate?.longitude != rhs.coordinate?.longitude {
        return false
    }
    
    if lhs.name != rhs.name {
        return false
    }
    return true
}
