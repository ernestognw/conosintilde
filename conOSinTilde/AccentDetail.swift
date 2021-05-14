//
//  InstructionsController.swift
//  conOSinTilde
//
//  Created by Ernesto García on 22/04/21.
//

import UIKit

class AccentDetail: UIViewController {
    var level : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func perfomSegue(_ sender: Any) {
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
        let svc = segue.destination as? InstructionsViewController
        
        if segue.identifier == "true_false" {
            svc?.title = "Verdadero o falso"
        } else if segue.identifier == "checklist" {
            svc?.title = "Checklist"
        } else if segue.identifier == "relate" {
            svc?.title = "Relaciona"
        }
    }
}
