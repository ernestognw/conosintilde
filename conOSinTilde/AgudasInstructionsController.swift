//
//  InstructionsController.swift
//  conOSinTilde
//
//  Created by Ernesto García on 22/04/21.
//

import UIKit

class AgudasInstructionsController: UIViewController {
    let level : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if level == 0 {
            
        } else if level == 1 {
            // Pending
        } else if level == 2 {
            // Pending
        }
    }

}
