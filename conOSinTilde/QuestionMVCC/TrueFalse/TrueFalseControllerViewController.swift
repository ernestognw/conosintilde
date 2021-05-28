//
//  TrueFalseControllerViewController.swift
//  conOSinTilde
//
//  Created by Ernesto García on 22/04/21.
//

import UIKit

class Highscore: NSObject, NSCoding {
    var game : [Int] = []
    required init(coder aDecoder: NSCoder) {
        game = aDecoder.decodeObject(forKey: "game") as? [Int] ?? []
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(game, forKey: "game")
        
    }
}

class TrueFalseControllerViewController: UIViewController {
    var question : String?
    var word : String?
    var answer : Bool?
    var game : TrueFalse?
    var wordsArray : NSArray?
    var wordControl : Array<Bool> = Array()
    var arraySize : Int?
    var correcto: Bool?
    var highscores: [Int]?
    var gameType:GAMETYPE!
    
    var counter=1
    @IBOutlet weak var countLb: UILabel!
    @IBOutlet weak var resultLb: UILabel!
    @IBOutlet weak var questionLb: UILabel!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var wordLb: UILabel!
    @IBOutlet weak var continueBtn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Obtener array de ejercicios
        let dictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource: getGameType(), ofType: "plist")!);
        self.wordsArray = (dictionary?["TRUEFALSE"] as! NSArray)
        self.arraySize = wordsArray!.count
        wordControl = Array(repeating: false, count: self.arraySize!)
        countLb.text=String(counter)
        getNewGame()
        
        
    }
    
    func getGameType() -> String {
        switch gameType {
        case .AGUDAS:
            return "aguda"
        case .GRAVES:
            return "graves"
        case .ESDRUJULAS:
            return "esdrujulas"
        default:
            return ""
        }
    }
    
    @IBAction func BotonVerdadero(_ sender: Any) {
        if(game!.answer){
            correcto = true; //Correcto
        } else {
            correcto = false; //Incorrecto
        }
        showResult()
    }
    
    @IBAction func BotonFalso(_ sender: UIButton) {
        if(game!.answer){
            correcto = false; //Incorrecto
        } else {
            correcto = true; //Correcto
        }
        showResult()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("load data")
        let defaults = UserDefaults.standard
        highscores = defaults.object(forKey: getGameType() + "_TRUEFALSE") as? [Int] ?? [Int]()
        print(highscores!)
       
    }
    
    @IBAction func ContinueButton(_ sender: UIButton) {
        if (correcto == false) {
            let defaults = UserDefaults.standard
            if (highscores!.count > 5) {
                highscores!.sort { (lhs, rhs) in return lhs < rhs }
                for (index, score) in highscores!.enumerated() {
                    if (counter > score) {
                        highscores![index] = counter - 1
                        defaults.set(highscores, forKey: getGameType() + "_TRUEFALSE")
                        break
                    }
                 }
            }
            else {
                highscores!.append(counter - 1)
                defaults.set(highscores, forKey: getGameType() + "_TRUEFALSE")
            }

            self.performSegue(withIdentifier: "game_over", sender: nil)
            return
        }
        counter+=1
        getNewGame()
    }
    
    func getNewGame(){
        
        falseBtn.isEnabled = true
        trueBtn.isEnabled = true
        continueBtn.isEnabled = false
        resultLb.text=""
        countLb.text=String(counter)
        
        //Numero random de pregunta
        var randomInt = Int.random(in: 0..<(self.arraySize!-1))
        while wordControl[randomInt] {
            randomInt = Int.random(in: 0..<(self.arraySize!-1))
        }

        
        //Convertir a objeto TrueFalse
        let obj = self.wordsArray![randomInt] as! NSDictionary
        self.wordControl[randomInt] = true
        let word = obj["word"] as! String;
        let question = obj["question"] as! String;
        let answer = obj["answer"] as! Bool;
        game = TrueFalse.init(question: question, word: word, answer: answer)
        //tf.print()
        
        //Mostrar en pantalla
        wordLb.text = word
        questionLb.text = question
    }
    
    
    
    func showResult(){
        
        falseBtn.isEnabled = false
        trueBtn.isEnabled = false
        continueBtn.isEnabled = true
        
        if(correcto!){
            resultLb.text="Correcto!"
            resultLb.textColor=#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            resultLb.text="Incorrecto"
            resultLb.textColor=#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
           
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let svc = segue.destination as? GameOverViewController {
            svc.counter = counter - 1
            svc.message_string = "Lastima haz perdido!"
            svc.highscore =  counter
        }
    
    
    }
}
