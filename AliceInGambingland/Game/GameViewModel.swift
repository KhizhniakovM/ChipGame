//
//  GameViewModel.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import Foundation

class GameViewModel {
    // MARK: - Properties
    var myChips: SomeChips?
    var enemyChips: SomeChips?
    
    var chipToKill: Color?
    
    var chipper: Chipper?
    var showTutorial: Bool = false
    var endOfTheGame: Bool = false
    
    var winner: Color?
    var goldenChips: Int {
        get {
            return UserDefaults.standard.integer(forKey: UserDefaults.Keys.goldenChipsCount)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Keys.goldenChipsCount)
        }
    }
    
    // MARK: - Methods
    func checkChips(color: Color, group: inout SomeChips, completion: @escaping (Int) -> Void) {
        if group.firstDefender.color == color && group.firstDefender.isLife == true {
            group.firstDefender.isLife = false
            completion(1)
            return
        }
        if group.secondDefender.color == color && group.secondDefender.isLife == true {
            group.secondDefender.isLife = false
            completion(2)
            return
        }
        if group.thirdDefender.color == color && group.thirdDefender.isLife == true {
            group.thirdDefender.isLife = false
            completion(3)
            return
        }
        guard group.firstDefender.isLife == false, group.secondDefender.isLife == false, group.thirdDefender.isLife == false, group.king.color == color else { return }
        group.king.isLife = false
        endOfTheGame = true
        completion(4)
    }
}
