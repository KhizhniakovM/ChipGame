//
//  GameStartView.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 29.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class GameStartView: BasicGameView {
    var completion: ((Color) -> Void)?
    
    // MARK: - UI
    // MARK: - FortuneWheel, FortuneArrow
    lazy var arrow: UIImageView = {
        let arrow = UIImageView()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.image = UIImage(named: "Arrow")
        return arrow
    }()
    lazy var fortuneWheel: FortuneWheel = {
        let wheel = FortuneWheel()
        wheel.translatesAutoresizingMaskIntoConstraints = false
        wheel.completion = { self.completion!(wheel.result) }
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
    // MARK: - Boom animation
    lazy var boom: UIImageView = {
        let boom = UIImageView()
        boom.translatesAutoresizingMaskIntoConstraints = false
        boom.image = Constants.boom
        return boom
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
            arrow.widthAnchor.constraint(equalTo: fortuneWheel.widthAnchor, multiplier: 0.375),
            
            fortuneWheel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fortuneWheel.topAnchor.constraint(equalTo: self.topAnchor, constant: UIScreen.main.bounds.height / 15),
            fortuneWheel.heightAnchor.constraint(equalTo: fortuneWheel.widthAnchor),
            fortuneWheel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.325),
            
            rightPlayer.heightAnchor.constraint(equalTo: rightPlayer.widthAnchor),
            rightPlayer.heightAnchor.constraint(equalTo: leftPlayer.heightAnchor),
            rightPlayer.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: UIScreen.main.bounds.width / 3),
            rightPlayer.centerYAnchor.constraint(equalTo: fortuneWheel.centerYAnchor),
            
            leftPlayer.heightAnchor.constraint(equalTo: leftPlayer.widthAnchor),
            leftPlayer.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -(UIScreen.main.bounds.width / 3)),
            leftPlayer.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 6),
            leftPlayer.centerYAnchor.constraint(equalTo: fortuneWheel.centerYAnchor),
            
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
    
    func addBoomToDiedChip(from group: Group, state: Int) {
        switch state {
        case 1:
            if group == .player {
                self.myFirstDefChip.addSubview(boom)
                NSLayoutConstraint.activate([
                    self.boom.topAnchor.constraint(equalTo: self.myFirstDefChip.topAnchor),
                    self.boom.leadingAnchor.constraint(equalTo: self.myFirstDefChip.leadingAnchor),
                    self.boom.trailingAnchor.constraint(equalTo: self.myFirstDefChip.trailingAnchor),
                    self.boom.bottomAnchor.constraint(equalTo: self.myFirstDefChip.bottomAnchor),
                ])
            } else {
                self.enemyFirstDefChip.addSubview(boom)
                NSLayoutConstraint.activate([
                    self.boom.topAnchor.constraint(equalTo: self.enemyFirstDefChip.topAnchor),
                    self.boom.leadingAnchor.constraint(equalTo: self.enemyFirstDefChip.leadingAnchor),
                    self.boom.trailingAnchor.constraint(equalTo: self.enemyFirstDefChip.trailingAnchor),
                    self.boom.bottomAnchor.constraint(equalTo: self.enemyFirstDefChip.bottomAnchor),
                ])
            }
        case 2:
            if group == .player {
                self.mySecondDefChip.addSubview(boom)
                NSLayoutConstraint.activate([
                    self.boom.topAnchor.constraint(equalTo: self.mySecondDefChip.topAnchor),
                    self.boom.leadingAnchor.constraint(equalTo: self.mySecondDefChip.leadingAnchor),
                    self.boom.trailingAnchor.constraint(equalTo: self.mySecondDefChip.trailingAnchor),
                    self.boom.bottomAnchor.constraint(equalTo: self.mySecondDefChip.bottomAnchor),
                ])
            } else {
                self.enemySecondDefChip.addSubview(boom)
                NSLayoutConstraint.activate([
                    self.boom.topAnchor.constraint(equalTo: self.enemySecondDefChip.topAnchor),
                    self.boom.leadingAnchor.constraint(equalTo: self.enemySecondDefChip.leadingAnchor),
                    self.boom.trailingAnchor.constraint(equalTo: self.enemySecondDefChip.trailingAnchor),
                    self.boom.bottomAnchor.constraint(equalTo: self.enemySecondDefChip.bottomAnchor),
                ])
            }
        case 3:
            if group == .player {
                self.myThirdDefChip.addSubview(boom)
                NSLayoutConstraint.activate([
                    self.boom.topAnchor.constraint(equalTo: self.myThirdDefChip.topAnchor),
                    self.boom.leadingAnchor.constraint(equalTo: self.myThirdDefChip.leadingAnchor),
                    self.boom.trailingAnchor.constraint(equalTo: self.myThirdDefChip.trailingAnchor),
                    self.boom.bottomAnchor.constraint(equalTo: self.myThirdDefChip.bottomAnchor),
                ])
            } else {
                self.enemyThirdDefChip.addSubview(boom)
                NSLayoutConstraint.activate([
                    self.boom.topAnchor.constraint(equalTo: self.enemyThirdDefChip.topAnchor),
                    self.boom.leadingAnchor.constraint(equalTo: self.enemyThirdDefChip.leadingAnchor),
                    self.boom.trailingAnchor.constraint(equalTo: self.enemyThirdDefChip.trailingAnchor),
                    self.boom.bottomAnchor.constraint(equalTo: self.enemyThirdDefChip.bottomAnchor),
                ])
            }
        default:
            print("End of the game")
        }
    }
    
    func prepareForTransitionToSpinner() {
        self.fortuneWheel.isHidden = true
        self.arrow.isHidden = true
        self.leftPlayer.isHidden = true
        self.rightPlayer.isHidden = true
        self.arrowTurnLeft.isHidden = true
        self.arrowTurnRight.isHidden = true
        self.turnLabel.isHidden = true
    }
    
    func deleteAllChipsFromView() {
        self.myKingChip.isHidden = true
        self.myFirstDefChip.isHidden = true
        self.mySecondDefChip.isHidden = true
        self.myThirdDefChip.isHidden = true
        self.enemyKingChip.isHidden = true
        self.enemyFirstDefChip.isHidden = true
        self.enemySecondDefChip.isHidden = true
        self.enemyThirdDefChip.isHidden = true
        
        self.arrowTurnLeft.isHidden = true
        self.arrowTurnRight.isHidden = true
    }
    
    func completionForSpinner() {
        self.fortuneWheel.isHidden = false
        self.arrow.isHidden = false
        self.leftPlayer.isHidden = false
        self.rightPlayer.isHidden = false
        self.arrowTurnRight.isHidden = false
    }
}
