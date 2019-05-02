//
//  ViewController.swift
//  freeze
//
//  Created by Anmol Seth on 3/12/19.
//  Copyright © 2019 freeze. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var phoneNumberField: UITextField!
    //@IBOutlet var messageField: UITextField!
    
    @IBAction func sendData(sender: AnyObject) {
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let parameters: Parameters = [
            "To": phoneNumberField.text ?? "",
            //"Body": messageField.text ?? ""
            "Body": "Shaine Leibowitz is in danger! You can give her a call and find her location. https://goo.gl/maps/9e8ZmsDLW9hUjw619"
        ]
        Alamofire.request("http://localhost:5000/sms", method: .post, parameters: parameters, headers: headers).response { response in
            print(response)
            
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

