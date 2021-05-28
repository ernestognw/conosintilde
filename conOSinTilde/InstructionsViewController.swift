//
//  InstructionsViewController.swift
//  conOSinTilde
//
//  Created by Ernesto García on 14/05/21.
//

import UIKit

class InstructionsViewController: UIViewController {
    var level : Int!
    var gameType : GAMETYPE!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if level == 0 {
            let svc = segue.destination as? TrueFalseControllerViewController
            svc?.gameType = gameType
        } else if level == 1 {
            let svc = segue.destination as? ChecklistViewController
            svc?.gameType = gameType
        } else if level == 2 {
            let svc = segue.destination as? RelateViewController
            svc?.gameType = gameType
        }
        
     }


}
