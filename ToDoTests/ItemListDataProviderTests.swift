//
//  ItemListDataProviderTests.swift
//  ToDoTests
//
//  Created by Paulo Gama on 07/01/18.
//  Copyright © 2018 Paulo Gama. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemListDataProviderTests: XCTestCase {
    var itemListDataProvider: ItemListDataProvider!
    var tableView: UITableView!
    var controller: ItemListViewController!
    
    override func setUp() {
        super.setUp()
        
        itemListDataProvider = ItemListDataProvider()
        itemListDataProvider.itemManager = ItemManager()
    
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        controller.loadViewIfNeeded()
        
        tableView = controller.tableView
        tableView.dataSource = itemListDataProvider
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testNumberOfSectionsIsTwo() {
        let numberOfSections = tableView.numberOfSections
        
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testNumberOfRowsInFirstSectionIsToDoCount() {
        itemListDataProvider.itemManager?.add(ToDoItem(title: "Foo"))

        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        itemListDataProvider.itemManager?.add(ToDoItem(title: "Bar"))
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testNumberOfRowsInSecondSectionIsToDoneCount() {
        itemListDataProvider.itemManager?.add(ToDoItem(title: "Foo"))
        itemListDataProvider.itemManager?.add(ToDoItem(title: "Bar"))
        
        itemListDataProvider.itemManager?.checkItem(at: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        itemListDataProvider.itemManager?.checkItem(at: 0)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    func testCellForRowReturnsItemCell() {
        itemListDataProvider.itemManager?.add(ToDoItem(title: "Foo"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is ItemCell)
    }
    
    func testCellForRowDequeuesCellFromTableView() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = itemListDataProvider
        mockTableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        itemListDataProvider.itemManager?.add(ToDoItem(title: "Foo"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    func testCellForRowCallsConfigCell() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = itemListDataProvider
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        itemListDataProvider.itemManager?.add(ToDoItem(title: "Foo"))
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockItemCell
        
        XCTAssertTrue(cell.configCellGotCalled)
    }
    
}

extension ItemListDataProviderTests {
    
    class MockTableView: UITableView {
        
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
    }
    
    class MockItemCell: ItemCell {
        
        var configCellGotCalled = false
        
        override func configCell(with item: ToDoItem) {
            configCellGotCalled = true
        }
        
    }
}


