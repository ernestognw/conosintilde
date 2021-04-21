//
//  Course.swift
//  conOSinTilde
//
//  Created by Rodrigo Casale on 21/04/21.
//

import UIKit

class Course: NSObject {
    var category: String?
    var levels: [String]?
    
    init(category: String, levels: [String]) {
        self.category = category
        self.levels = levels
    }
}
