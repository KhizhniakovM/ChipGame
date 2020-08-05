//
//  Constants.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

enum Color {
    case white, red
}

enum Group {
    case player, enemy
}

enum Chips {
    case myKing, myFirstDefender, mySecondDefender, myThirdDefender,
        enemyKing, enemyFirstDefender, enemySecondDefender, enemyThirdDefender
}

enum Constants {
    // MARK: - Fonts
    enum Fonts {
        static let main = UIFont(name: "Bangers-Regular", size: 50)
        static let secondary = UIFont(name: "Bangers-Regular", size: 25)
        static let tertiary = UIFont(name: "Bangers-Regular", size: 35)
    }
    
    enum Keys {
        static let goldenChipsCount = "GoldenChips"
    }
    
    static let whiteChip = UIImage(named: "WhiteChip")
    static let redChip = UIImage(named: "RedChip")
    static let goldenChip = UIImage(named: "GoldenChip")
    
    static let bcgr = UIImage(named: "Bcgr")
    static let bluredBcgr = UIImage(named: "BluredBcgr")
    static let darkenOverlay = UIImage(named: "DarkenOverlay")
    static let goldenOverlay = UIImage(named: "GoldenOverlay")
    
    static let boom = UIImage(named: "Boom")
}
