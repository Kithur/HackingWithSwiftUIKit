//
//  Person.swift
//  Project10
//
//  Created by Pedro Antonio Vazquez Rodriguez on 19/01/20.
//  Copyright © 2020 Roberto Gutierrez. All rights reserved.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
