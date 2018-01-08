//
//  ItemListViewControllerTest.swift
//  ToDoTests
//
//  Created by Paulo Gama on 07/01/18.
//  Copyright © 2018 Paulo Gama. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemListViewControllerTests: XCTestCase {
    
    var itemListViewController: ItemListViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        itemListViewController = viewController as! ItemListViewController
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testTableViewAfterViewDidLoadIsNotNil() {
        itemListViewController.loadViewIfNeeded()
        
        XCTAssertNotNil(itemListViewController.tableView)
    }
    
    func testLoadingViewSetsTableViewDataSource() {
        itemListViewController.loadViewIfNeeded()
        
        XCTAssertTrue(itemListViewController.tableView.dataSource is ItemListDataProvider)
    }
    
    func testLoadingViewSetsTableViewDelegate() {
        itemListViewController.loadViewIfNeeded()
        
        XCTAssertTrue(itemListViewController.tableView.delegate is ItemListDataProvider)
    }
    
    func testLoadingViewDataSourceEqualDelegate() {
        itemListViewController.loadViewIfNeeded()
        
        XCTAssertEqual(itemListViewController.tableView.dataSource as? ItemListDataProvider, itemListViewController.tableView.delegate as? ItemListDataProvider)
    }
    
}
