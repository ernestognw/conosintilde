//
//  Checklist.swift
//  conOSinTilde
//
//  Created by Ernesto García on 22/04/21.
//

import UIKit

class Word : NSObject {
    var word : String
    var correct : Bool
    
    init(word : String, correct : Bool) {
        self.word = word
        self.correct = correct
    }
}

class Checklist: NSObject  {
    var question : String
    var words : [Word]

    
    init(question : String, words : [Word]) {
        self.question = question
        self.words = words
 
    }
}
