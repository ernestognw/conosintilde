//
//  TrueFalse.swift
//  conOSinTilde
//
//  Created by Ernesto García on 22/04/21.
//

import UIKit

class TrueFalse: NSObject {
    var question : String
    var word : String
    var answer : Bool
    
    init(question : String, word : String, answer : Bool) {
        self.question = question
        self.word = word
        self.answer = answer
    }
}
