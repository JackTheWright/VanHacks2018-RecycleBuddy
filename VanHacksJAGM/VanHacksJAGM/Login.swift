//
//  Login.swift
//  VanHacksJAGM
//
//  Created by Jack Wright on 2018-09-22.
//  Copyright © 2018 Jagms. All rights reserved.
//

import Foundation

import UIKit

class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signIn(_ sender: UIButton) {
        let myUrl = URL(string: "https://aqueous-forest-88166.herokuapp.com/"+"login");
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "POST"// Compose a query string
        
        let postString = "email=" + emailField.text! + "&password=" + passwordField.text!;
        
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
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = json {
                    
                    // Now we can access value of First Name by its key
                    let email = parseJSON["email"] as? String
                    print("email: \(String(describing: email))")
                    let fullname = parseJSON["fullname"] as? String
                    print("fullname: \(String(describing: fullname))")
                    let mlsaved = parseJSON["mlsaved"] as? String
                    print("mlsaved: \(String(describing: mlsaved))")
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

        
}
    

    
    


    
 
    
    
    

