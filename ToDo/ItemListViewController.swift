//
//  ItemListViewController.swift
//  ToDo
//
//  Created by Paulo Gama on 07/01/18.
//  Copyright © 2018 Paulo Gama. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }
    
}
