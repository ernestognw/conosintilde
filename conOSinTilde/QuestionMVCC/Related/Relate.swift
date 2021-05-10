//
//  Relate.swift
//  conOSinTilde
//
//  Created by Ernesto García on 22/04/21.
//

import UIKit

class ColumnOption : NSObject {
    var index : Int
    var value : String
    
    init(index : Int, value : String) {
        self.index = index
        self.value = value
    }
}

struct Relate {
    var question : String
    var left : [ColumnOption]
    var right : [ColumnOption]
    
    init(question : String, left : [ColumnOption], right : [ColumnOption]) {
        self.question = question
        self.left = left
        self.right = right
    }
}
