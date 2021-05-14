//
//  InstructionsController.swift
//  conOSinTilde
//
//  Created by Ernesto García on 22/04/21.
//

import UIKit

class AgudasInstructionsController: UIViewController {
    var level : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func perfomSegue(_ sender: Any) {
        print(level)
        if level == 0 {
            self.performSegue(withIdentifier: "true_false", sender: nil)
        } else if level == 1 {
            self.performSegue(withIdentifier: "checklist", sender: nil)
        } else if level == 2 {
            self.performSegue(withIdentifier: "relate", sender: nil)
        }
    
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "true_false" {
                if let svc = segue.destination as? TrueFalseControllerViewController {
                    print("1")
                }
            } else if segue.identifier == "checklist" {
                if let svc = segue.destination as? ChecklistViewController {
                    print("2")
                }
            }
    }

}
