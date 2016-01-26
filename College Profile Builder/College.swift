//
//  College.swift
//  College Profile Builder
//
//  Created by tbredemeier on 1/26/16.
//  Copyright © 2016 Zephyr Technology. All rights reserved.
//

import UIKit

class College: NSObject {
    var name = ""
    var location = ""
    var enrollment = 0
    var image = UIImage(named: "Default")

    convenience init(name: String, location: String, enrollment: Int, image: UIImage) {
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.image = image
    }

    convenience init(name: String) {
        self.init()
        self.name = name
    }

}