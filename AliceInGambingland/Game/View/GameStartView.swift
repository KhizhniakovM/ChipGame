//
//  GameStartView.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 29.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class GameStartView: BasicGameView {
    
    // MARK: - UI
    // MARK: - FortuneWheel, FortuneArrow
    lazy var arrow: UIImageView = {
        let arrow = UIImageView()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.image = UIImage(named: "Arrow")
        return arrow
    }()
    lazy var fortuneWheel: UIImageView = {
        let wheel = UIImageView()
        wheel.translatesAutoresizingMaskIntoConstraints = false
        wheel.image = UIImage(named: "FortuneWheel")
        wheel.isUserInteractionEnabled = true
        return wheel
    }()
    // MARK: - Players&Arrows
    lazy var leftPlayer: UIImageView = {
        let player = UIImageView()
        player.translatesAutoresizingMaskIntoConstraints = false
        player.image = UIImage(named: "WhiteColor")
        return player
    }()
    lazy var rightPlayer: UIImageView = {
        let player = UIImageView()
        player.translatesAutoresizingMaskIntoConstraints = false
        player.image = UIImage(named: "WhiteColor")
        return player
    }()
    lazy var arrowTurnLeft: UIImageView = {
        let arrow = UIImageView()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.image = UIImage(named: "ArrowTurn")?.withHorizontallyFlippedOrientation()
        return arrow
    }()
    lazy var arrowTurnRight: UIImageView = {
        let arrow = UIImageView()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.image = UIImage(named: "ArrowTurn")
        arrow.isHidden = true
        return arrow
    }()
    // MARK: - Label
    lazy var turnLabel = UILabel.makeBangerLabel(withText: "HEY, IT'S YOUR TURN! ", font: Constants.Fonts.main, lines: 1)
        
    // MARK: - Chips
    lazy var myKingChip: UIImageView = {
        let chip = UIImageView()
        chip.translatesAutoresizingMaskIntoConstraints = false
        chip.isUserInteractionEnabled = true
        return chip
    }()
    lazy var myFirstDefChip: UIImageView = {
        let chip = UIImageView()
        chip.translatesAutoresizingMaskIntoConstraints = false
        return chip
    }()
    lazy var mySecondDefChip: UIImageView = {
        let chip = UIImageView()
        chip.translatesAutoresizingMaskIntoConstraints = false
        return chip
    }()
    lazy var myThirdDefChip: UIImageView = {
        let chip = UIImageView()
        chip.translatesAutoresizingMaskIntoConstraints = false
        return chip
    }()
    lazy var enemyKingChip: UIImageView = {
        let chip = UIImageView()
        chip.translatesAutoresizingMaskIntoConstraints = false
        return chip
    }()
    lazy var enemyFirstDefChip: UIImageView = {
        let chip = UIImageView()
        chip.translatesAutoresizingMaskIntoConstraints = false
        return chip
    }()
    lazy var enemySecondDefChip: UIImageView = {
        let chip = UIImageView()
        chip.translatesAutoresizingMaskIntoConstraints = false
        return chip
    }()
    lazy var enemyThirdDefChip: UIImageView = {
        let chip = UIImageView()
        chip.translatesAutoresizingMaskIntoConstraints = false
        return chip
    }()
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupUI() {
        self.addSubview(fortuneWheel)
        self.addSubview(arrow)
        
        self.addSubview(leftPlayer)
        self.addSubview(rightPlayer)
        self.addSubview(arrowTurnLeft)
        self.addSubview(arrowTurnRight)
        
        self.addSubview(turnLabel)
        
        self.addSubview(myKingChip)
        self.addSubview(myFirstDefChip)
        self.addSubview(mySecondDefChip)
        self.addSubview(myThirdDefChip)
        
        self.addSubview(enemyKingChip)
        self.addSubview(enemyFirstDefChip)
        self.addSubview(enemySecondDefChip)
        self.addSubview(enemyThirdDefChip)

        NSLayoutConstraint.activate([
            arrow.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            arrow.topAnchor.constraint(equalTo: self.topAnchor, constant: UIScreen.main.bounds.height / 30),
            arrow.widthAnchor.constraint(equalTo: arrow.heightAnchor),
            arrow.widthAnchor.constraint(equalTo: fortuneWheel.widthAnchor, multiplier: 0.35),
            
            fortuneWheel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fortuneWheel.topAnchor.constraint(equalTo: self.topAnchor, constant: UIScreen.main.bounds.height / 17.5),
            fortuneWheel.heightAnchor.constraint(equalTo: fortuneWheel.widthAnchor),
            fortuneWheel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.325),
            
            leftPlayer.heightAnchor.constraint(equalTo: leftPlayer.widthAnchor),
            leftPlayer.heightAnchor.constraint(equalTo: rightPlayer.heightAnchor),
            leftPlayer.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: UIScreen.main.bounds.width / 3),
            leftPlayer.centerYAnchor.constraint(equalTo: fortuneWheel.centerYAnchor),
            
            rightPlayer.heightAnchor.constraint(equalTo: rightPlayer.widthAnchor),
            rightPlayer.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -(UIScreen.main.bounds.width / 3)),
            rightPlayer.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 6),
            rightPlayer.centerYAnchor.constraint(equalTo: fortuneWheel.centerYAnchor),
            
            arrowTurnLeft.centerYAnchor.constraint(equalTo: fortuneWheel.centerYAnchor),
            arrowTurnLeft.heightAnchor.constraint(equalTo: fortuneWheel.heightAnchor, multiplier: 0.25),
            arrowTurnLeft.widthAnchor.constraint(equalTo: arrowTurnLeft.heightAnchor, multiplier: 0.25),
            arrowTurnLeft.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -(UIScreen.main.bounds.width / 5)),
            
            arrowTurnRight.centerYAnchor.constraint(equalTo: fortuneWheel.centerYAnchor),
            arrowTurnRight.heightAnchor.constraint(equalTo: fortuneWheel.heightAnchor, multiplier: 0.25),
            arrowTurnRight.widthAnchor.constraint(equalTo: arrowTurnLeft.heightAnchor, multiplier: 0.25),
            arrowTurnRight.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: UIScreen.main.bounds.width / 5),
            
            turnLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            turnLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(UIScreen.main.bounds.height / 4.1)),
            turnLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            
            myKingChip.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            myKingChip.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: UIScreen.main.bounds.height / 3.75),
            myKingChip.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.11),
            myKingChip.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3125),
            
            myFirstDefChip.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: UIScreen.main.bounds.height / 5.75),
            myFirstDefChip.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -(UIScreen.main.bounds.width / 3.8)),
            myFirstDefChip.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.085),
            myFirstDefChip.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.225),
            
            mySecondDefChip.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: UIScreen.main.bounds.height / 5.75),
            mySecondDefChip.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mySecondDefChip.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.085),
            mySecondDefChip.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.225),
            
            myThirdDefChip.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: UIScreen.main.bounds.height / 5.75),
            myThirdDefChip.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: UIScreen.main.bounds.width / 3.8),
            myThirdDefChip.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.085),
            myThirdDefChip.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.225),
            
            enemyKingChip.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            enemyKingChip.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(UIScreen.main.bounds.height / 9.3)),
            enemyKingChip.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.0625),
            enemyKingChip.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.165),
            
            enemyFirstDefChip.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(UIScreen.main.bounds.height / 64)),
            enemyFirstDefChip.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -(UIScreen.main.bounds.width / 5.4)),
            enemyFirstDefChip.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.0625),
            enemyFirstDefChip.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.16),

            enemySecondDefChip.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            enemySecondDefChip.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(UIScreen.main.bounds.height / 64)),
            enemySecondDefChip.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.0625),
            enemySecondDefChip.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.16),

            enemyThirdDefChip.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(UIScreen.main.bounds.height / 64)),
            enemyThirdDefChip.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: UIScreen.main.bounds.width / 5.4),
            enemyThirdDefChip.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.0625),
            enemyThirdDefChip.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.16),
        ])
        
        
    }

}
