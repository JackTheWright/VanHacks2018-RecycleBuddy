//
//  Leaderboard.swift
//  VanHacksJAGM
//
//  Created by Alex Brown on 2018-09-23.
//  Copyright © 2018 Jagms. All rights reserved.
//

import Foundation

import UIKit



class LeaderboardVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myUrl = URL(string: "https://aqueous-forest-88166.herokuapp.com/leaderboard");
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
            
            if let parseJSON = json {
                
                // Now we can access value of First Name by its key
                let user0name =  parseJSON["user0"] as! String
                let user1name =  parseJSON["user1"] as! String
                let user2name =  parseJSON["user2"] as! String
                let user3name =  parseJSON["user3"] as! String
                let user4name =  parseJSON["user4"] as! String
                let user0score =  parseJSON["score0"] as! Int
                let user1score =  parseJSON["score1"] as! Int
                let user2score =  parseJSON["score2"] as! Int
                let user3score =  parseJSON["score3"] as! Int
                let user4score =  parseJSON["score4"] as! Int
                
                
                DispatchQueue.main.async {
                    self.score1.text = "\(user0name) has \(user0score)"
                    self.score2.text = "\(user1name) has \(user1score)"
                    self.score3.text = "\(user2name) has \(user2score)"
                    self.score4.text = "\(user3name) has \(user3score)"
                    self.score5.text = "\(user4name) has \(user4score)"
                }
                if (global.email == "0") {
                    
                    
                    UserDefaults.standard.set(false, forKey: "badpass")
                    
                }
                else {
                    
                    UserDefaults.standard.set(true, forKey: "badpass")
                }
                
                
                
            }
        } catch {
            print(error)
        }
    }
    task.resume()
        
    }
    @IBOutlet weak var score1: UILabel!
     @IBOutlet weak var score2: UILabel!
     @IBOutlet weak var score3: UILabel!
     @IBOutlet weak var score4: UILabel!
     @IBOutlet weak var score5: UILabel!

}

