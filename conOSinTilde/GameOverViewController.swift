//
//  GameOverViewController.swift
//  conOSinTilde
//
//  Created by Christian on 5/5/21.
//

import UIKit

extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}

class GameOverViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var number: UILabel!

    var counter: Int!
    var message_string: String!
    var highscore: Int!
    override func viewDidLoad() {
        super.viewDidLoad()

        score.text = "Score: \(counter!)"
        message.text = message_string!
        number.text = "\(counter!) / \(highscore!)"
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true;
    }
    
    @IBAction func return_to_menu(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

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
