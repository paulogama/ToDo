//
//  LocationTests.swift
//  ToDoTests
//
//  Created by Paulo Gama on 06/01/18.
//  Copyright © 2018 Paulo Gama. All rights reserved.
//

import XCTest
@testable import ToDo
import CoreLocation

class LocationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitSetsName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }
    
    func testInitSetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: coordinate)
        
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }
    
    func testEqualLocationsAreEqual() {
        let first = Location(name: "Foo")
        let second = Location(name: "Foo")
        
        XCTAssertEqual(first, second)
    }
    
    func assertLocationNotEqualWith(firstName: String, firstLongLat: (Double, Double)?, secondName: String, secondLongLat: (Double, Double)?) {
        
        var firstCoord: CLLocationCoordinate2D? = nil
        if let firstLongLat = firstLongLat {
            firstCoord = CLLocationCoordinate2D(latitude: firstLongLat.0, longitude: firstLongLat.1)
        }
        let firstLocation = Location(name: firstName, coordinate: firstCoord)
        
        var secondCoord: CLLocationCoordinate2D? = nil
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(latitude: secondLongLat.0, longitude: secondLongLat.1)
        }
        let secondLocation = Location(name: secondName, coordinate: secondCoord)
        
        XCTAssertNotEqual(firstLocation, secondLocation)
    }
    
    func testLocationsWhenLatitudeDiffersAreNotEqual() {
        assertLocationNotEqualWith(firstName: "Foo", firstLongLat: (1.0, 0.0), secondName: "Foo", secondLongLat: (0.0, 0.0))
    }
    
    func testLocationsWhenLongitudeDiffersAreNotEqual() {
        let firstCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 1.0)
        let first = Location(name: "Foo", coordinate: firstCoordinate)
        let secondCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        let second = Location(name: "Foo", coordinate: secondCoordinate)
        
        XCTAssertNotEqual(first, second)
    }
    
    func testLocationsWhenOnlyOneHasCoordinateAreNotEqual() {
        assertLocationNotEqualWith(firstName: "Foo", firstLongLat: (0.0, 0.0), secondName: "Foo", secondLongLat: nil)
    }
 
    func testLocationsWhenNamesDifferAreNotEqual() {
        assertLocationNotEqualWith(firstName: "Foo", firstLongLat: nil, secondName: "Bar", secondLongLat: nil)
    }
    
}
