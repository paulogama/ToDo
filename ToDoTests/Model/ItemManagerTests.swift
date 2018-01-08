//
//  ItemManagerTests.swift
//  ToDoTests
//
//  Created by Paulo Gama on 06/01/18.
//  Copyright © 2018 Paulo Gama. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemManagerTests: XCTestCase {
    
    var itemManager: ItemManager!
    
    override func setUp() {
        super.setUp()
        itemManager = ItemManager()
    }
    
    override func tearDown() {
        itemManager = nil
        super.tearDown()
    }
    
    func testToDoCountInitiallyIsZero() {
        XCTAssertEqual(itemManager.toDoCount, 0)
    }
    
    func testDoneCountInitiallyIsZero() {
        XCTAssertEqual(itemManager.doneCount, 0)
    }
    
    func testAddItemIncreasesToDoCountToOne() {
        itemManager.add(ToDoItem(title: ""))
        
        XCTAssertEqual(itemManager.toDoCount, 1)
    }
    
    func testItemAtReturnsAddedItem() {
        let item = ToDoItem(title: "Foo")
        itemManager.add(item)
        
        let returnedItem = itemManager.item(at: 0)
        
        XCTAssertEqual(returnedItem.title, item.title)
    }
    
    func testcheckItemAtChangesCount() {
        itemManager.add(ToDoItem(title: ""))
        
        itemManager.checkItem(at: 0)
        
        XCTAssertEqual(itemManager.toDoCount, 0)
        XCTAssertEqual(itemManager.doneCount, 1)
    }
    
    func testCheckItemAtRemovesItFromToDoItems() {
        let first = ToDoItem(title: "First")
        let second = ToDoItem(title: "Second")
        itemManager.add(first)
        itemManager.add(second)
        
        itemManager.checkItem(at: 0)
        
        XCTAssertEqual(itemManager.item(at: 0).title, "Second")
    }
    
    func testDoneItemAtReturnsCheckedItem() {
        let item = ToDoItem(title: "Foo")
        itemManager.add(item)
        itemManager.checkItem(at: 0)
        
        let returnedItem = itemManager.doneItem(at: 0)
        
        XCTAssertEqual(returnedItem.title, item.title)
    }
    
    func testEqualItemsAreEqual() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Foo")
        
        XCTAssertEqual(first, second)
    }
    
    func testItemsWhenLocationDiffersAreNotEqual() {
        let first = ToDoItem(title: "", location: Location(name: "Foo"))
        let second = ToDoItem(title: "", location: Location(name: "Bar"))
        
        XCTAssertNotEqual(first, second)
    }
    
    func testRemoveAllResultsInCountsBeZero() {
        itemManager.add(ToDoItem(title: "Foo"))
        itemManager.add(ToDoItem(title: "Bar"))
        itemManager.checkItem(at: 0)
        
        XCTAssertEqual(itemManager.toDoCount, 1)
        XCTAssertEqual(itemManager.doneCount, 1)
        
        itemManager.removeAll()
        XCTAssertEqual(itemManager.toDoCount, 0)
        XCTAssertEqual(itemManager.doneCount, 0)
    }
    
    func testAddWhenItemIsAlreadyAddedDoesNotIncreaseCount() {
        itemManager.add(ToDoItem(title: "Foo"))
        itemManager.add(ToDoItem(title: "Foo"))
        
        XCTAssertEqual(itemManager.toDoCount, 1)
    }
    
}
