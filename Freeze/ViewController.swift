//
//  ViewController.swift
//  Freeze
//
//  Created by Shaine Leibowitz on 2/14/19.
//  Copyright © 2019 Shaine Leibowitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func authorizeTapped(sender: AnyObject) {
        HealthKitManager.authorizeHealthKit()
    }

}

