//
//  DrinkyfillVC.swift
//  VanHacksJAGM
//
//  Created by Jack Wright on 2018-09-22.
//  Copyright © 2018 Jagms. All rights reserved.
//

import Foundation

import UIKit

class DrinkyFillVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @IBOutlet weak var keybored: UITextField!
    
    @IBOutlet weak var OZ2ML: UISegmentedControl!
    
    @IBOutlet weak var largeLabel: UILabel!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var smallLabel: UILabel!
    @IBOutlet weak var large: UIImageView!
    @IBOutlet weak var medium: UIImageView!
    @IBOutlet weak var small: UIImageView!
    
    @IBAction func tapLarge(recognizer:UITapGestureRecognizer) {
        var largeLabelInt = Int(largeLabel.text ?? "0")
        largeLabelInt = (largeLabelInt ?? 0) + 1
        largeLabel.text = String(largeLabelInt!)
        
    }
    @IBAction func tapMedium(recognizer:UITapGestureRecognizer) {
        var mediumLabelInt = Int(mediumLabel.text ?? "0")
        mediumLabelInt = (mediumLabelInt ?? 0) + 1
        mediumLabel.text = String(mediumLabelInt!)
    }
    @IBAction func tapSmall(recognizer:UITapGestureRecognizer) {
        var smallLabelInt = Int(smallLabel.text ?? "0")
        smallLabelInt = (smallLabelInt ?? 0) + 1
        smallLabel.text = String(smallLabelInt!)
    }
    
    @IBAction func customMLOZ(_ sender: Any) {
        keybored.keyboardType = UIKeyboardType.decimalPad
    }
    
    
    @IBAction func Switcher(_ sender: Any) {
        switch OZ2ML.selectedSegmentIndex
        {
        case 0:
            global.units = "mL"
        case 1:
            global.units = "L"
        default:
            break
        }
        
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        largeLabel.text = "0"
        mediumLabel.text = "0"
        smallLabel.text = "0"
        keybored.text = ""
        OZ2ML.selectedSegmentIndex = 0
        
    }
    
    
    @IBAction func Submit(_ sender: UIButton) {
        let bigCount = Int(largeLabel.text ?? "0")! * 2000
        let midCount = Int(mediumLabel.text ?? "0")! * 1000
        let lowCount = Int(smallLabel.text ?? "0")! * 500
        var cusCount = Int()
        if global.units == "L" {
            cusCount = Int(keybored.text ?? "0")! * 1000
        }
        else {
            cusCount = Int(keybored.text ?? "0")!
        }
        let bottlescore = floor(Double(bigCount + midCount + lowCount + cusCount) / 500)
        var totalScore = UserDefaults.standard.integer(forKey: "totalScore")
        totalScore = totalScore + Int(bottlescore)
        UserDefaults.standard.set(totalScore, forKey: "totalScore")
        largeLabel.text = "0"
        mediumLabel.text = "0"
        smallLabel.text = "0"
        keybored.text = ""
        OZ2ML.selectedSegmentIndex = 0
        
        
    }
    
}

