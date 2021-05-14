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
    
    @IBOutlet weak var countLb: UILabel!
    @IBOutlet weak var resultLb: UILabel!
    @IBOutlet weak var questionLb: UILabel!
    @IBOutlet weak var wordLb: UILabel!
    @IBOutlet weak var continueBtn: UIButton!

    @IBOutlet weak var label1A: UILabel!
    @IBOutlet weak var label1B: UILabel!
    @IBOutlet weak var label2A: UILabel!
    @IBOutlet weak var label2B: UILabel!
    @IBOutlet weak var label3A: UILabel!
    @IBOutlet weak var label3B: UILabel!
    @IBOutlet weak var label4A: UILabel!
    @IBOutlet weak var label4B: UILabel!
    @IBOutlet weak var label5A: UILabel!
    @IBOutlet weak var label5B: UILabel!
    @IBOutlet weak var label6A: UILabel!
    @IBOutlet weak var label6B: UILabel!
    
    var rect1A:UIView!
    var rect1B:UIView!
    var line = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Obtener array de ejercicios
        let dictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "agudas", ofType: "plist")!);
        self.wordsArray = (dictionary?["RELATE"] as! NSArray)
        let wordsArray = (self.wordsArray!.object(at: 0) as! NSDictionary)["words"] as! NSArray
        
        self.arraySize = wordsArray.count
        
        for i in 0...(self.arraySize!-1) {
            let word = wordsArray[i] as! NSArray
            self.words.append(WordPair(index: i, first: word[0] as! String, second: word[1] as! String))
            self.words[i].print()
        }
        wordControl = Array(repeating: false, count: self.arraySize!)
        
        wordControlA = Array(repeating: false, count: self.arraySize!)
        
        wordControlB = Array(repeating: false, count: self.arraySize!)
        countLb.text=String(counter)
        getNewGame()

        // Do any additional setup after loading the view.
        
        rect1A = UIView(frame: CGRect(x: label1A.frame.maxX , y: label1A.frame.origin.y, width: 10, height: 10))
        rect1A.backgroundColor = UIColor.green
        self.view.addSubview(rect1A)

        rect1B = UIView(frame: CGRect(x: label1A.frame.maxX + CGFloat(50), y: label1A.frame.origin.y, width: 10, height: 10))
        rect1B.backgroundColor = UIColor.green
        self.view.addSubview(rect1B)

        // and the UIPanGestureRecognizer objects

        let gesture1 = UIPanGestureRecognizer(target: self, action: #selector(dragView))
        rect1A.addGestureRecognizer(gesture1)

        let gesture2 = UIPanGestureRecognizer(target: self, action: #selector(dragView))
        rect1B.addGestureRecognizer(gesture2)

        addLine(fromPoint: rect1A.center, toPoint:rect1B.center)
    }
    
    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint)
        {
        line.removeFromSuperlayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        line.lineWidth = 2
        line.lineJoin = CAShapeLayerLineJoin.round
        self.view.layer.addSublayer(line)
    }
    
    @objc func dragView(_ sender: UIPanGestureRecognizer, num: CGFloat)
    {
        let point = sender.location(in: self.view)
        let theDraggedView = sender.view!
        theDraggedView.center = point
        addLine(fromPoint: rect1A.center, toPoint:rect1B.center)
    }
    
    @IBAction func ContinueButton(_ sender: UIButton) {
        counter+=1
        getNewGame()
    }
    
    func getNewGame(){
        continueBtn.isEnabled = false
        resultLb.text=""
        countLb.text=String(counter)
        
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
                print(wordControl)
            }
            self.wordControl[randomInt] = true
            print(" V------------------------V ")
            print(randomInt)
            var randomIntA = Int.random(in: 0..<((self.arraySize!)))
            while wordControlA[randomIntA] {
                randomIntA = Int.random(in: 0..<(self.arraySize!))
            }
            self.wordControlA[randomIntA] = true
            print(randomIntA)

            var randomIntB = Int.random(in: 0..<((self.arraySize!)))
            while wordControlB[randomIntB] {
                randomIntB = Int.random(in: 0..<(self.arraySize!))
            }
            self.wordControlB[randomIntB] = true
            print(randomIntB)
            print(" A------------------------A ")
            switch randomIntA {
            case 0:
                label1A.text? = words[randomInt].first
            case 1:
                label2A.text? = words[randomInt].first
            case 2:
                label3A.text? = words[randomInt].first
            case 3:
                label4A.text? = words[randomInt].first
            case 4:
                label5A.text? = words[randomInt].first
            case 5:
                label6A.text? = words[randomInt].first
            default:
                print("nada")
            }
            switch randomIntB {
            case 0:
                label1B.text = words[randomInt].second
            case 1:
                label2B.text = words[randomInt].second
            case 2:
                label3B.text = words[randomInt].second
            case 3:
                label4B.text = words[randomInt].second
            case 4:
                label5B.text = words[randomInt].second
            case 5:
                label6B.text = words[randomInt].second
            default:
                print("nada")
            }

          }
        
        
//
//        //Convertir a objeto TrueFalse
//        let obj = self.wordsArray![randomInt] as! NSDictionary
//        self.wordControl[randomInt] = true
//        let word = obj["word"] as! [String];
//        let question = obj["question"] as! String;
//        let answer = obj["answer"] as! Bool;
//        questionLb.text = question¡
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
