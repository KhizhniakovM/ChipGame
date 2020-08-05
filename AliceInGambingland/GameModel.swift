//
//  GameModel.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 30.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import Foundation

struct Chip {
    var color: Color
    var isLife: Bool = true
}

struct MyChips: SomeChips {
    
    var king = Chip(color: .white)
    
    var firstDefender = Chip(color: .white)
    var secondDefender = Chip(color: .white)
    var thirdDefender = Chip(color: .white)
}

struct EnemyChips: SomeChips {
    var king = Chip(color: .white)
    
    var firstDefender = Chip(color: .white)
    var secondDefender = Chip(color: .white)
    var thirdDefender = Chip(color: .white)
}
