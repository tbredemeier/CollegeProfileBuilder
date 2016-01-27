//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by tbredemeier on 1/26/16.
//  Copyright © 2016 Zephyr Technology. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var college: College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = String(college.enrollment)
        websiteTextField.text = college.webpage
        imageView.image = college.image
    }

    @IBAction func onTappedButton(sender: UIButton) {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.enrollment = Int(enrollmentTextField.text!)!
        college.webpage = websiteTextField.text!
    }

    @IBAction func onGoButtonTapped(sender: UIButton) {
        if let url = NSURL(string: websiteTextField.text!) {
            let svc = SFSafariViewController(URL: url)
            svc.delegate = self
            self.presentViewController(svc, animated: true, completion: nil)
        }
    }

    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
