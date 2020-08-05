//
//  RootViewModel.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import Foundation

class ChooseViewModel {
    // MARK: - Properties
    var myChips = MyChips()
    var enemyChips = EnemyChips()
    
    // MARK: - Initializer
    init() {
        chooseEnemyChips()
    }
    
    // MARK: - Methods
    func chooseEnemyChips() {
        enemyChips.king.color = randomColor(number: Int.random(in: 0...1))
        enemyChips.firstDefender.color = randomColor(number: Int.random(in: 0...1))
        enemyChips.secondDefender.color = randomColor(number: Int.random(in: 0...1))
        enemyChips.thirdDefender.color = randomColor(number: Int.random(in: 0...1))
    }
    
    private func randomColor(number: Int) -> Color {
        switch number {
        case 0:
            return .white
        case 1:
            return .red
        default:
            fatalError("There is only 2 numbers")
        }
    }
}
