//
//  AluminumAddVC.swift
//  VanHacksJAGM
//
//  Created by Jack Wright on 2018-09-22.
//  Copyright © 2018 Jagms. All rights reserved.
//

import Foundation
import UIKit

class AluminumAddVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    @IBOutlet weak var keypad: UITextField!
    
    @IBOutlet weak var Oz2mL: UISegmentedControl!
    
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
    
    @IBAction func custommLoZ(_ sender: UITextField) {
        keypad.keyboardType = UIKeyboardType.decimalPad
    }
    
    
    
    @IBAction func Switcher(_ sender: Any) {
        var units = ""
        switch Oz2mL.selectedSegmentIndex
        {
        case 0:
            units = "Oz"
        case 1:
            units = "mL"
        default:
            break
        }
        print(units)
        
    }
    @IBAction func Reset(_ sender: UIButton) {
        largeLabel.text = "0"
        mediumLabel.text = "0"
        smallLabel.text = "0"
        keypad.text = ""
        Oz2mL.selectedSegmentIndex = 0
    }
    
    @IBAction func Submit(_ sender: UIButton) {
        let bigCount = Int(largeLabel.text ?? "0")! * 2000
        let midCount = Int(mediumLabel.text ?? "0")! * 1000
        let lowCount = Int(smallLabel.text ?? "0")! * 500
        let bottlescore = (bigCount + midCount + lowCount) / 500
        var totalScore = UserDefaults.standard.integer(forKey: "totalScore")
        totalScore = totalScore + bottlescore
        UserDefaults.standard.set(totalScore, forKey: "totalScore")
        largeLabel.text = "0"
        mediumLabel.text = "0"
        smallLabel.text = "0"
        keypad.text = ""
        Oz2mL.selectedSegmentIndex = 0
        
    }
    
}
