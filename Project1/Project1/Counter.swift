//
//  Counter.swift
//  Project1
//
//  Created by 2020-2 on 27/01/20.
//  Copyright © 2020 Roberto Gutiérrez. All rights reserved.
//

import UIKit

class Counter: NSObject, Codable {
    var timesOpened: Int
    
    init(timesOpened: Int) {
        self.timesOpened = timesOpened
    }
}
