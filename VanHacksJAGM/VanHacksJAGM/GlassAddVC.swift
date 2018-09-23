//
//  GlassAddVC.swift
//  VanHacksJAGM
//
//  Created by Jack Wright on 2018-09-22.
//  Copyright © 2018 Jagms. All rights reserved.
//

import Foundation
import UIKit

class GlassAddVC: UIViewController {
    
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
    

    @IBAction func customMLOZ(_ sender: UITextField) {
        keypad.keyboardType = UIKeyboardType.decimalPad
    }
    
    
    @IBAction func Switcher(_ sender: Any) {
        switch Oz2mL.selectedSegmentIndex
        {
        case 0:
            global.units = "L"
        case 1:
            global.units = "mL"
        default:
            break
        }
        
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        largeLabel.text = "0"
        mediumLabel.text = "0"
        smallLabel.text = "0"
        keypad.text = ""
        Oz2mL.selectedSegmentIndex = 0

    }
    
    @IBAction func Submit(_ sender: UIButton) {
        let bigCount = Int(largeLabel.text ?? "0")! * 750
        let midCount = Int(mediumLabel.text ?? "0")! * 500
        let lowCount = Int(smallLabel.text ?? "0")! * 350
        var cusCount = Int()
        if global.units == "L" {
            cusCount = Int(keypad.text ?? "0")! * 1000
        }
        else {
            cusCount = Int(keypad.text ?? "0")!
        }
        let bottlescore = floor(Double(bigCount + midCount + lowCount + cusCount) / 500)
        print(bottlescore)
        UserDefaults.standard.set(bottlescore, forKey: "bottleScore")
            print(UserDefaults.standard.integer(forKey: "bottleScore"))
        var totalScore = UserDefaults.standard.integer(forKey: "totalScore")
        totalScore = totalScore + Int(bottlescore)
        UserDefaults.standard.set(totalScore, forKey: "totalScore")
        largeLabel.text = "0"
        mediumLabel.text = "0"
        smallLabel.text = "0"
        keypad.text = ""
        Oz2mL.selectedSegmentIndex = 0
        let storyBoard: UIStoryboard = UIStoryboard(name: "RecycleAdd", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "thankyou") as! ThankYouVC
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
}
