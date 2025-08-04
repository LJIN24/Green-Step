//
//  User.swift
//  GreenStep
//
//  Created by JIN on 7/31/25.
//

import UIKit

struct User: Codable {
    var today: Double = 0
    var total: Double = 0
    
    
    mutating func add(_ amount: Double) {
      today += amount
      total += amount
    }
}

