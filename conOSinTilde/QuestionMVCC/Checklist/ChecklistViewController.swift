//
//  QuestionTemplateViewController.swift
//  conOSinTilde
//
//  Created by Christian on 5/2/21.
//

import UIKit

extension UITableView {
    func deselectAllRows(animated: Bool) {
        guard let selectedRows = indexPathsForSelectedRows else { return }
        for indexPath in selectedRows {
            deselectRow(at: indexPath, animated: animated)
            if let cell = cellForRow(at: indexPath) {
                cell.accessoryType = .none
            }
        }
        
        
    }
}

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
    var highscores: [Int]?
    var correctCount = 0

    var gameType:GAMETYPE!

    @IBOutlet weak var countLb: UILabel!
    @IBOutlet weak var resultLb: UILabel!
    @IBOutlet weak var questionLb: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var continueBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Obtener array de ejercicios
        let dictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource: getGameType(), ofType: "plist")!);
        self.wordsArray = (dictionary?["CHECKLIST"] as! NSArray)
        self.arraySize = wordsArray!.count
        wordControl = Array(repeating: false, count: self.arraySize!)
        countLb.text=String(counter)
        getNewGame()
        
        table.delegate = self
        table.dataSource = self
        table.allowsMultipleSelection = true
        
        let defaults = UserDefaults.standard
        highscores = defaults.object(forKey: getGameType() + "_CHECKLIST") as? [Int] ?? [Int]()
        // Do any additional setup after loading the view.
    }
    
    
    func getGameType() -> String {
        switch gameType {
        case .AGUDAS:
            return "agudas"
        case .GRAVES:
            return "graves"
        case .ESDRUJULAS:
            return "esdrujulas"
        default:
            return ""
        }
    }
    
    @IBAction func ContinueButton(_ sender: UIButton) {
        correcto = true
        for word in selectedWords {
            if word.correct == false {
                correcto = false
            }
        }
        showResult()
        if (correcto == true) {
            counter+=1
            getNewGame()
        } else {
            let defaults = UserDefaults.standard
            if (highscores!.count > 5) {
                highscores!.sort { (lhs, rhs) in return lhs < rhs }
                for (index, score) in highscores!.enumerated() {
                    if (counter > score) {
                        highscores![index] = counter
                        defaults.set(highscores, forKey: getGameType() + "_CHECKLIST")
                        break
                    }
                 }
            }
            else {
                highscores!.append(counter)
                defaults.set(highscores, forKey: getGameType() + "_CHECKLIST")
            }

            self.performSegue(withIdentifier: "game_over", sender: nil)
            return
        }

    }
    
    func getNewGame(){
        continueBtn.isEnabled = false
        resultLb.text=""
        countLb.text=String(counter)
        correctCount = 0
        
        //Numero random de pregunta
        var randomInt = Int.random(in: 0..<(self.arraySize!-1))
        while wordControl[randomInt] {
            randomInt = Int.random(in: 0..<(self.arraySize!-1))
        }

        
        //Convertir a objeto Checklist
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
            print(correct)
            correctCount =  correctCount + (correct == true ? 1 : 0)
            print(correctCount)
            let object = Word.init(word: word, correct: correct)
            wordArr.append(object)
            print(wordArr.count)

          }

        
        let question = obj["question"] as! String;
        game = Checklist.init(question: question, words: wordArr)
        questionLb.text = question
        table.deselectAllRows(animated: true)
        table.reloadData()
    }
    
    
    func showResult(){
        
        if(correcto!){
            continueBtn.isEnabled = true
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
        if (selectedRows.count >= correctCount)  {
            continueBtn.isEnabled = true
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let i = selectedRows.firstIndex(of: indexPath.row) {
            selectedWords.remove(at: i)
            selectedRows.remove(at: i)
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .none
            }
            if (selectedRows.count <= correctCount)  {
                continueBtn.isEnabled = false
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = game?.words[indexPath.row].word
        // Configure the cell...
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let svc = segue.destination as? GameOverViewController {
            svc.counter = counter - 1
            svc.message_string = "Lastima haz perdido!"
            svc.highscore =  counter
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
