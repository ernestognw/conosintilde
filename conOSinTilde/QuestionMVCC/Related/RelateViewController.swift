//
//  RelateViewCOntroller.swift
//  conOSinTilde
//
//  Created by Christian on 5/2/21.
//

import UIKit

class RelateViewController: UIViewController {
    var question : String?
    var word : String?
    var answer : Bool?
    var game : Checklist?
    var wordsArray : NSArray?
    var wordControl : Array<Bool> = Array()
    var wordControlA : Array<Bool> = Array()
    var wordControlB : Array<Bool> = Array()
    var arraySize : Int?
    var correcto: Bool?
    var counter=1
    var words = [WordPair]()
    var wordsRandom = [WordPair]()
    var wordsResult = [WordPair]()
    var wordsCorrect : Array<Bool> = Array()
    var correct: Int!
    var highscores: [Int]?
    var gameType: GAMETYPE!
    
    @IBOutlet weak var countLb: UILabel!
    @IBOutlet weak var resultLb: UILabel!
    @IBOutlet weak var questionLb: UILabel!
    @IBOutlet weak var wordLb: UILabel!
    @IBOutlet weak var continueBtn: UIButton!

    @IBOutlet weak var button0A: UIButton!
    @IBOutlet weak var button0B: UIButton!
    @IBOutlet weak var button1A: UIButton!
    @IBOutlet weak var button1B: UIButton!
    @IBOutlet weak var button2A: UIButton!
    @IBOutlet weak var button2B: UIButton!
    @IBOutlet weak var button3A: UIButton!
    @IBOutlet weak var button3B: UIButton!
    @IBOutlet weak var button4A: UIButton!
    @IBOutlet weak var button4B: UIButton!
    @IBOutlet weak var button5A: UIButton!
    @IBOutlet weak var button5B: UIButton!
    
    var rect1A:UIView!
    var rect1B:UIView!
    var line = CAShapeLayer()
    
    var line0 = CAShapeLayer()
    var line1 = CAShapeLayer()
    var line2 = CAShapeLayer()
    var line3 = CAShapeLayer()
    var line4 = CAShapeLayer()
    var line5 = CAShapeLayer()
    
    var currA: Int!
    var currAPos = CGPoint(x: 0, y: 0)
    var currB: Int!
    var currBPos = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Obtener array de ejercicios
        
        getNewGame()

        // Do any additional setup after loading the view.
        

        // and the UIPanGestureRecognizer objects

//        let gesture1 = UIPanGestureRecognizer(target: self, action: #selector(dragView)
//
//)
//        rect1A.addGestureRecognizer(gesture1)
//
//        let gesture2 = UIPanGestureRecognizer(target: self, action: #selector(dragView))
//        rect1B.addGestureRecognizer(gesture2)
//
//        addLine(fromPoint: rect1A.center, toPoint:rect1B.center)
    }
    
//    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint)
//        {
//        line.removeFromSuperlayer()
//        let linePath = UIBezierPath()
//        linePath.move(to: start)
//        linePath.addLine(to: end)
//        line.path = linePath.cgPath
//        line.strokeColor = UIColor.red.cgColor
//        line.lineWidth = 2
//        line.lineJoin = CAShapeLayerLineJoin.round
//        self.view.layer.addSublayer(line)
//    }
//
//    @objc func dragView(_ sender: UIPanGestureRecognizer, num: CGFloat)
//    {
//        let point = sender.location(in: self.view)
//        let theDraggedView = sender.view!
//        theDraggedView.center = point
//        addLine(fromPoint: rect1A.center, toPoint:rect1B.center)
//    }
    
    @IBAction func ContinueButton(_ sender: UIButton) {
        counter+=1
        if(checkWrong(correctArray: wordsCorrect) == false) {
            endGame()
        }
        getNewGame()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("load data")
        let defaults = UserDefaults.standard
        highscores = defaults.object(forKey: getGameType() + "_RELATE") as? [Int] ?? [Int]()
        print(highscores!)
       
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
    
    func endGame() {
        let defaults = UserDefaults.standard
        if (highscores!.count > 5) {
            highscores!.sort { (lhs, rhs) in return lhs < rhs }
            for (index, score) in highscores!.enumerated() {
                if (counter > score) {
                    highscores![index] = counter - 1
                    defaults.set(highscores, forKey: getGameType() + "_RELATE")
                    break
                }
             }
        }
        else {
            highscores!.append(counter - 1)
            defaults.set(highscores, forKey: getGameType() + "_RELATE")
        }

        self.performSegue(withIdentifier: "game_over", sender: nil)
    }
    
    func checkWrong(correctArray : Array<Bool>) -> Bool {
        for i in 0...5 {
            if (correctArray[i] == false){
                return false
            }
        }
        return true
    }
    
    func getNewGame(){
        correct = 0
        let dictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "agudas", ofType: "plist")!);
        self.wordsArray = (dictionary?["RELATE"] as! NSArray)
        let wordsArray = (self.wordsArray!.object(at: 0) as! NSDictionary)["words"] as! NSArray
        
        self.arraySize = wordsArray.count
        
        for i in 0...(self.arraySize!-1) {
            let word = wordsArray[i] as! NSArray
            self.words.append(WordPair(index: i, first: word[0] as! String, second: word[1] as! String))
            self.wordsRandom.append(WordPair(index: i, first: "" , second: "" ))
            self.wordsResult.append(WordPair(index: i, first: "" , second: "" ))
            self.words[i].print()
        }
        wordControl = Array(repeating: false, count: self.arraySize!)
        
        wordControlA = Array(repeating: false, count: 6)
        
        wordControlB = Array(repeating: false, count: 6)
        
        wordsCorrect = Array(repeating: false, count: 6)
        countLb.text=String(counter)
        
        resultLb.text=""
        countLb.text=String(counter)
        
        line0.removeFromSuperlayer()
        line1.removeFromSuperlayer()
        line2.removeFromSuperlayer()
        line3.removeFromSuperlayer()
        line4.removeFromSuperlayer()
        line5.removeFromSuperlayer()
        
        //Numero random de pregunta
//

        for i in 0...5 {
            
            self.words[i].print()
            print("AAAAAKDJNCSLJD")
            print(self.arraySize!-1)
            print(wordControl)
            print("AAAAAKDJNCSLJD")
            var randomInt = Int.random(in: 0..<((self.arraySize!)))
            while wordControl[randomInt] {
                randomInt = Int.random(in: 0..<(self.arraySize!))
            }
            self.wordControl[randomInt] = true
            print(" V------------------------V ")
            print(randomInt)
            var randomIntA = Int.random(in: 0..<6)
            while wordControlA[randomIntA] {
                randomIntA = Int.random(in: 0..<6)
            }
            self.wordControlA[randomIntA] = true
            print(randomIntA)

            var randomIntB = Int.random(in: 0..<6)
            while wordControlB[randomIntB] {
                randomIntB = Int.random(in: 0..<6)
            }
            self.wordControlB[randomIntB] = true
            print(randomIntB)
            print(" A------------------------A ")
            print(words[randomInt].print())
            switch randomIntA {
            case 0:
                button0A.setTitle(words[randomInt].first, for: .normal)
            case 1:
                button1A.setTitle(words[randomInt].first, for: .normal)
            case 2:
                button2A.setTitle(words[randomInt].first, for: .normal)
            case 3:
                button3A.setTitle(words[randomInt].first, for: .normal)
            case 4:
                button4A.setTitle(words[randomInt].first, for: .normal)
            case 5:
                button5A.setTitle(words[randomInt].first, for: .normal)
            default:
                print("nada")
            }
            switch randomIntB {
            case 0:
                button0B.setTitle(words[randomInt].second, for: .normal)
            case 1:
                button1B.setTitle(words[randomInt].second, for: .normal)
            case 2:
                button2B.setTitle(words[randomInt].second, for: .normal)
            case 3:
                button3B.setTitle(words[randomInt].second, for: .normal)
            case 4:
                button4B.setTitle(words[randomInt].second, for: .normal)
            case 5:
                button5B.setTitle(words[randomInt].second, for: .normal)
            default:
                print("nada")
            }
            
            wordsRandom[randomIntA].first = words[randomInt].first
            wordsRandom[randomIntA].index = words[randomInt].index
            wordsRandom[randomIntB].second = words[randomInt].second
          }
    }
    
    
    func showResult(){
        continueBtn.isEnabled = true
        
        print(wordsCorrect)
        
        if(correcto!){
            resultLb.text="Correcto!"
            resultLb.textColor=#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            resultLb.text="Incorrecto"
            resultLb.textColor=#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }

    @IBAction func button0APressed(_ sender: Any) {
        startLine(num: 0)
    }
    @IBAction func button0BPressed(_ sender: Any) {
        endLine(num: 0)
    }
    
    @IBAction func button1APressed(_ sender: Any) {
        startLine(num: 1)
    }
    @IBAction func button1BPressed(_ sender: Any) {
        endLine(num: 1)
    }
    
    @IBAction func button2APressed(_ sender: Any) {
        startLine(num: 2)
    }
    @IBAction func button2BPressed(_ sender: Any) {
        endLine(num: 2)
    }
    
    @IBAction func button3APressed(_ sender: Any) {
        startLine(num: 3)
    }
    @IBAction func button3BPressed(_ sender: Any) {
        endLine(num: 3)
    }
    
    @IBAction func button4APressed(_ sender: Any) {
        startLine(num: 4)
    }
    @IBAction func button4BPressed(_ sender: Any) {
        endLine(num: 4)
    }
    
    @IBAction func button5APressed(_ sender: Any) {
        startLine(num: 5)
    }
    @IBAction func button5BPressed(_ sender: Any) {
        endLine(num: 5)
    }
    func startLine(num: Int) {
        currA = num
        switch currA {
        case 0:
            print(currAPos.x)
            currAPos.x = button0A.frame.maxX
            currAPos.y = button0A.frame.midY
        case 1:
            print(currAPos.x)
            currAPos.x = button1A.frame.maxX
            currAPos.y = button1A.frame.midY
        case 2:
            print(currAPos.x)
            currAPos.x = button2A.frame.maxX
            currAPos.y = button2A.frame.midY
        case 3:
            print(currAPos.x)
            currAPos.x = button3A.frame.maxX
            currAPos.y = button3A.frame.midY
        case 4:
            print(currAPos.x)
            currAPos.x = button4A.frame.maxX
            currAPos.y = button4A.frame.midY
        case 5:
            print(currAPos.x)
            currAPos.x = button5A.frame.maxX
            currAPos.y = button5A.frame.midY
        default:
            return
        }
    }
    func endLine(num: Int) {
        currB = num
        switch currB {
        case 0:
            currBPos.x = button0B.frame.minX
            currBPos.y = button0B.frame.midY
        case 1:
            currBPos.x = button1B.frame.minX
            currBPos.y = button1B.frame.midY
        case 2:
            currBPos.x = button2B.frame.minX
            currBPos.y = button2B.frame.midY
        case 3:
            currBPos.x = button3B.frame.minX
            currBPos.y = button3B.frame.midY
        case 4:
            currBPos.x = button4B.frame.minX
            currBPos.y = button4B.frame.midY
        case 5:
            currBPos.x = button5B.frame.minX
            currBPos.y = button5B.frame.midY
        default:
            return
        }
        let index = wordsRandom[currA].index
        print(index)
        wordsResult[index].first = wordsRandom[currA].first
        wordsResult[index].second = wordsRandom[currB].second
        if(wordsRandom[currA].first == words[index].first && wordsRandom[currB].second == words[index].second) {
            wordsCorrect[currA] = true
        } else {
            wordsCorrect[currA] = false
        }
        print(wordsResult[index].print())
        print(wordsCorrect)
        drawLine(withLine: currA, fromPoint: currAPos, toPoint: currBPos)
    }
    
    func drawLine(withLine lineNum: Int, fromPoint start: CGPoint, toPoint end:CGPoint) {
        
        switch lineNum {
        case 0:
            line = line0
            line.strokeColor = UIColor.systemRed.cgColor
        case 1:
            line = line1
            line.strokeColor = UIColor.systemGreen.cgColor
        case 2:
            line = line2
            line.strokeColor = UIColor.systemTeal.cgColor
        case 3:
            line = line3
            line.strokeColor = UIColor.systemPink.cgColor
        case 4:
            line = line4
            line.strokeColor = UIColor.systemBlue.cgColor
        case 5:
            line = line5
            line.strokeColor = UIColor.systemOrange.cgColor
        default:
            return
        }
        
        line.removeFromSuperlayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.lineWidth = 4
        line.lineJoin = CAShapeLayerLineJoin.round
        self.view.layer.addSublayer(line)
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
}
