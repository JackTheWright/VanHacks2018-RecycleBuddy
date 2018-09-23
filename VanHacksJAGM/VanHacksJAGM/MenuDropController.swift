//
//  MenuDropController.swift
//  VanHacksJAGM
//
//  Created by Alex Brown on 2018-09-23.
//  Copyright © 2018 Jagms. All rights reserved.
//

import UIKit

class MenuDropController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ExitMenu(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
