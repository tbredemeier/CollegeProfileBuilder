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
    @IBOutlet weak var editButton: UIBarButtonItem!
    var colleges : [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        colleges.append(College(name: "TCU", location: "Ft. Worth, Texas", enrollment: 6000, webpage: "http://www.tcu.edu/", image: UIImage(named: "TCU")!))
        colleges.append(College(name: "University of Iowa", location: "Iowa City, Iowa", enrollment: 22000, webpage: "http://www.uiowa.edu/", image: UIImage(named: "Iowa")!))
        colleges.append(College(name: "Lake Forest GSM", location: "Lake Forest, Illinois", enrollment: 1000, webpage: "http://www.lakeforestmba.edu", image: UIImage(named: "Lake Forest")!))
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        return cell
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }

    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }

    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add City Here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(College(name: collegeTextField.text!))
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }

    @IBAction func onTappedEditButton(sender: UIBarButtonItem) {
        if sender.tag == 0 {
            tableView.editing = true
            sender.tag = 1
        }
        else {
            tableView.editing = false
            sender.tag = 0
        }
    }
}

