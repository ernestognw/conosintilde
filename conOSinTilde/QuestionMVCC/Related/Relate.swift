//
//  Relate.swift
//  conOSinTilde
//
//  Created by Ernesto García on 22/04/21.
//

import UIKit

class WordPair : NSObject {
    var index : Int
    var first : String
    var second : String
    
    init(index: Int, first: String, second: String) {
        self.index = index
        self.first = first
        self.second = second
    }
    func print(){
        Swift.print("Word:", self.index, "\t { ", self.first, "-", self.second, " } ")
    }
}

struct Relate {
    var question : String
    var words = [WordPair]()
    
    init(question : String, words : Array<WordPair>) {
        self.question = question
        self.words = words
    }
    
    
    func print(){
        Swift.print("question: ", self.question)
        Swift.print("Words: ", self.words)
    }
}
