//
//  SomeChips.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 03.08.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import Foundation

protocol SomeChips {
    var king: Chip { get set }
    
    var firstDefender: Chip { get set }
    var secondDefender: Chip { get set }
    var thirdDefender: Chip { get set }
}
