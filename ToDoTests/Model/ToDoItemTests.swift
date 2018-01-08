//
//  ToDoItemTests.swift
//  ToDoTests
//
//  Created by Paulo Gama on 03/01/18.
//  Copyright © 2018 Paulo Gama. All rights reserved.
//

import XCTest
@testable import ToDo

class ToDoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitWhenGivenTitleSetsTitle() {
        let item = ToDoItem(title: "Foo")
        XCTAssertEqual(item.title, "Foo", "should set title")
    }
    
    func testInitWhenGivenDescriptionSetsDescription() {
        let item = ToDoItem(title: "", itemDescription: "Bar")
        XCTAssertEqual(item.itemDescription, "Bar", "should set description")
    }
    
    func testInitSetsTimeStamp() {
        let item = ToDoItem(title: "", timestamp: 0.0)
        XCTAssertEqual(item.timestamp, 0.0, "should set timestamp")
    }
    
    func testInitWhenGivenLocationSetsLocation() {
        let location = Location(name: "Foo")
        let item = ToDoItem(title: "", location: location)
        
        XCTAssertEqual(item.location?.name, location.name, "shoud set location")
    }
    
    func testItemsWhenFirstLocationIsNilAreNotEqual() {
        let first = ToDoItem(title: "", location: Location(name: "Foo"))
        let second = ToDoItem(title: "", location: nil)
        
        XCTAssertNotEqual(first, second)
    }
    
    func testItemsWhenSecondLocationIsNilAreNotEqual() {
        let first = ToDoItem(title: "", location: nil)
        let second = ToDoItem(title: "", location: Location(name: "Foo"))
        
        XCTAssertNotEqual(first, second)
    }
    
    func testItemsWhenTimestampsDifferAreNotEqual() {
        let first = ToDoItem(title: "Foo", timestamp: 1.0)
        let second = ToDoItem(title: "Foo", timestamp: 0.0)
        
        XCTAssertNotEqual(first, second)
    }
    
    func testItemsWhenDescriptionsDifferAreNotEqual() {
        let first = ToDoItem(title: "Foo", itemDescription: "Bar")
        let second = ToDoItem(title: "Foo", itemDescription: "Baz")
        
        XCTAssertNotEqual(first, second)
    }
    
    func testItemsWhenTitleDifferAreNotEqual() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Bar")
        
        XCTAssertNotEqual(first, second)
    }
    
}
