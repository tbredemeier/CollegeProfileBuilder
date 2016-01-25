//
//  ViewController.swift
//  College Profile Builder
//
//  Created by tbredemeier on 1/25/16.
//  Copyright © 2016 Zephyr Technology. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var colleges = ["Texas Christian University", "University of Iowa", "Lake Forest GSM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

