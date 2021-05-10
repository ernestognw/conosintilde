//
//  QuestionTemplateViewController.swift
//  conOSinTilde
//
//  Created by Christian on 5/2/21.
//

import UIKit

class QuestionTemplateViewController<T> : UIViewController {
    var question : String?
    var word : String?
    var answer : Bool?
    var game : T?
    var wordsArray : NSArray?
    var wordControl : Array<Bool> = Array()
    var arraySize : Int?
    var correcto: Bool?
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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ContinueButton(_ sender: UIButton) {
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
        let word = obj["word"] as! [String];
        let question = obj["question"] as! String;
        let answer = obj["answer"] as! Bool;
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
