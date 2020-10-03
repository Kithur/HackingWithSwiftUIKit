//
//  Petition.swift
//  Project7
//
//  Created by Roberto Gutiérrez on 23/11/19.
//  Copyright © 2019 Roberto Gutiérrez. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
