//
//  Question.swift
//  conOSinTilde
//
//  Created by Christian on 5/2/21.
//

import UIKit

protocol QuestionType {
    init?(raw: AnyObject)
}


struct Question<T: QuestionType> {
    var value: T
  
    init(value: T) {
        self.value = value
    }
  
    init?(raw: AnyObject) {
        guard let value = T(raw: raw) else { return nil }
        self.init(value: value)
    }
}
