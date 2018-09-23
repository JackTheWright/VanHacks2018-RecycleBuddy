//
//  refillOrRecycleVC.swift
//  VanHacksJAGM
//
//  Created by Jack Wright on 2018-09-22.
//  Copyright © 2018 Jagms. All rights reserved.
//

import Foundation

import UIKit

class RefillOrRecycleVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scoreTotal = UserDefaults.standard.integer(forKey: "totalScore")
        bottles.text = String(scoreTotal) + " Bottles"
        UserDefaults.standard.set(true, forKey: "isLogged")
        
    }
    @IBOutlet weak var bottles: UILabel!
    
}
