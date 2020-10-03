//
//  Picture.swift
//  Consolidation4
//
//  Created by 2020-2 on 28/01/20.
//  Copyright © 2020 Roberto Gutierrez. All rights reserved.
//

import UIKit

class Picture: NSObject, Codable {
    var filename: String
    var caption: String
    
    init(filename: String, caption: String) {
        self.filename = filename
        self.caption = caption
    }
}
