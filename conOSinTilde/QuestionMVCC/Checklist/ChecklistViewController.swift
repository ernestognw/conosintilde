//
//  QuestionTemplateViewController.swift
//  conOSinTilde
//
//  Created by Christian on 5/2/21.
//

import UIKit

class ChecklistViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var question : String?
    var word : String?
    var answer : Bool?
    var game : Checklist?
    var wordsArray : NSArray?
    var wordControl : Array<Bool> = Array()
    var arraySize : Int?
    var correcto: Bool?
    var counter=1
    var selectedWords: [Word] = []
    var selectedRows: [Int] = []

    @IBOutlet weak var countLb: UILabel!
    @IBOutlet weak var resultLb: UILabel!
    @IBOutlet weak var questionLb: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var continueBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        //Obtener array de ejercicios
        let dictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "agudas", ofType: "plist")!);
        self.wordsArray = (dictionary?["CHECKLIST"] as! NSArray)
        self.arraySize = wordsArray!.count
        wordControl = Array(repeating: false, count: self.arraySize!)
        countLb.text=String(counter)
        getNewGame()
        
        table.delegate = self
        table.dataSource = self
        table.allowsMultipleSelection = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ContinueButton(_ sender: UIButton) {
        correcto = true
        for word in selectedWords {
            if word.correct == false {
                correcto = false
            }
        }
        showResult()
        counter+=1
        getNewGame()
    }
    
    func getNewGame(){
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
        let words = obj["words"] as! [[String : Any]]
        var wordArr : [Word] = []
        for dict in words {
            // Condition required to check for type safety :)
              guard let word = dict["word"] as? String,
                    let correct = dict["correct"] as? Bool
              else {
                    print("Something is not well")
                   continue
              }
            let object = Word.init(word: word, correct: correct)
            wordArr.append(object)
          }

        
        let question = obj["question"] as! String;
        game = Checklist.init(question: question, words: wordArr)
        questionLb.text = question
    }
    
    
    func showResult(){
        continueBtn.isEnabled = true
        
        if(correcto!){
            resultLb.text="Correcto!"
            resultLb.textColor=#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            resultLb.text="Incorrecto"
            resultLb.textColor=#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (game?.words.count)!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWords.append((game?.words[indexPath.row])!)
        selectedRows.append(indexPath.row)
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
       
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let i = selectedRows.firstIndex(of: indexPath.row) {
            selectedWords.remove(at: i)
            selectedRows.remove(at: i)
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .none
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = game?.words[indexPath.row].word
        // Configure the cell...
        return cell
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
