//
//  ThankYou.swift
//  VanHacksJAGM
//
//  Created by Jack Wright on 2018-09-23.
//  Copyright © 2018 Jagms. All rights reserved.
//

import Foundation

import UIKit

class ThankYouVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scoreTotal = UserDefaults.standard.integer(forKey: "bottleScore")
        print(UserDefaults.standard.integer(forKey:"bottleScore"))
        bottleTotal.text = String(scoreTotal) + " Bottles"
        
    }
    
    @IBOutlet weak var bottleTotal: UILabel!
    
    
    
}
