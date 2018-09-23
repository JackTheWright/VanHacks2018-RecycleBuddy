//
//  Register.swift
//  VanHacksJAGM
//
//  Created by Jack Wright on 2018-09-22.
//  Copyright © 2018 Jagms. All rights reserved.
//

import Foundation

import UIKit

class RegistrationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        registration.text=""
    }
    
    @IBOutlet weak var registration: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email:UITextField!
    @IBOutlet weak var pass:UITextField!
    @IBOutlet weak var passconf:UITextField!
    
    @IBAction func submit(_ sender: UIButton) {
        let myUrl = URL(string: "https://aqueous-forest-88166.herokuapp.com/"+"newUser");
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "POST"// Compose a query string
        
        let postString = "email=" + email.text! + "&password=" + pass.text! + "&fullname=" + name.text! ;
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            
            // You can print out response object
            print("response = \(String(describing: response))")
            
            //Let's convert response sent from a server side script to a NSDictionary object:
        }
        task.resume()
        
        pass.text! = ""
        name.text! = ""
        passconf.text! = ""
        email.text! = ""
        registration.text! = "Registration Complete!"
        UserDefaults.standard.set(0, forKey: "totalScore")
    }
}
    


