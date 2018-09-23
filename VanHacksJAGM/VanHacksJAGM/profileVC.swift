//
//  profileVC.swift
//  VanHacksJAGM
//
//  Created by Jack Wright on 2018-09-23.
//  Copyright © 2018 Jagms. All rights reserved.
//

import Foundation

import UIKit

class profileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let score = Double(UserDefaults.standard.integer(forKey: "totalScore"))
        bottleadd.text = String(Int(score)) + " Bottles"
        shoes.text = String(Int(floor(Double(score / 10))))
        Bags.text = String(Int(floor(Double((score) / 16))))
        Leggings.text = String(Int(floor(Double((score) / 25))))
        
        namespace.text = global.fullname
        
        
        
    }
    @IBOutlet weak var bottleadd: UILabel!
    @IBOutlet weak var shoes: UILabel!
    @IBOutlet weak var Bags: UILabel!
    @IBOutlet weak var Leggings: UILabel!
    @IBOutlet weak var namespace: UILabel!
    
}
