//
//  HistorialResultadosVC.swift
//  conOSinTilde
//
//  Created by Pamela on 25/05/21.
//

import UIKit

class HistorialResultadosVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let defaults = UserDefaults.standard
    var type : String?
    var game: String?
    var highscores : [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var key = type! + game!
        print(key)
        highscores = defaults.object(forKey: key) as? [Int] ?? [Int]()
        highscores!.sort { (lhs, rhs) in return lhs > rhs }
        
        print(highscores)

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if highscores != nil {
            return highscores!.count;
        }
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! ResultCell
        if highscores != nil {
            cell.juego.text = "Juego #" + (String(indexPath.row + 1) )
            cell.puntos.text = String(highscores![indexPath.row])
        }
        
        return cell
    }
    

}
