//
//  BasicFinishGameView.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 03.08.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class BasicFinishGameView: UIView {
    // MARK: - UI
    lazy var darkenOverlay: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        imageView.image = Constants.darkenOverlay
        return imageView
    }()
    
    lazy var goldenOverlay: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        imageView.image = Constants.goldenOverlay
        return imageView
    }()
    
    lazy var winnerChip: UIImageView = {
        let winnerChip = UIImageView()
        winnerChip.translatesAutoresizingMaskIntoConstraints = false
        return winnerChip
    }()
    
    lazy var crown: UIImageView = {
        let crown = UIImageView()
        crown.translatesAutoresizingMaskIntoConstraints = false
        crown.image = UIImage(named: "Crown")
        return crown
    }()
    
    lazy var playAgainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "PlayAgainButton"), for: .normal)
        return button
    }()
    
    lazy var textLabel = UILabel.makeBangerLabel(withText: "GAME OVER! ", font: Constants.Fonts.main, lines: 1)
    lazy var totalLabel = UILabel.makeBangerLabel(withText: "TOTAL: ", font: Constants.Fonts.secondary, lines: 1)
    lazy var yourRewardLabel = UILabel.makeBangerLabel(withText: "YOUR REWARD: ", font: Constants.Fonts.secondary, lines: 1)
    lazy var reward = UILabel.makeBangerLabel(withText: "X 200 ", font: Constants.Fonts.main, lines: 1)
    
    lazy var littleCoinImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Constants.goldenChip
        imageView.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        return imageView
    }()
    lazy var littleRewardCoinImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Constants.goldenChip
        imageView.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        return imageView
    }()
    
    lazy var totalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalLabel, littleCoinImage])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    lazy var rewardStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [reward, littleRewardCoinImage])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    lazy var totalRewardStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [yourRewardLabel, rewardStack])
        stack.isHidden = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        return stack
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
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(darkenOverlay)
        self.addSubview(goldenOverlay)
        self.addSubview(winnerChip)
        self.addSubview(crown)
        self.addSubview(textLabel)
        self.addSubview(totalStack)
        self.addSubview(totalRewardStack)
        self.addSubview(playAgainButton)
        
        NSLayoutConstraint.activate([
            darkenOverlay.topAnchor.constraint(equalTo: self.topAnchor),
            darkenOverlay.leftAnchor.constraint(equalTo: self.leftAnchor),
            darkenOverlay.rightAnchor.constraint(equalTo: self.rightAnchor),
            darkenOverlay.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            goldenOverlay.topAnchor.constraint(equalTo: self.topAnchor),
            goldenOverlay.leftAnchor.constraint(equalTo: self.leftAnchor),
            goldenOverlay.rightAnchor.constraint(equalTo: self.rightAnchor),
            goldenOverlay.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            winnerChip.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            winnerChip.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            winnerChip.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.33),
            winnerChip.heightAnchor.constraint(equalTo: winnerChip.widthAnchor, multiplier: 0.7),
            
            crown.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            crown.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(UIScreen.main.bounds.height / 10)),
            crown.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            crown.heightAnchor.constraint(equalTo: crown.widthAnchor, multiplier: 0.6),
            
            playAgainButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            playAgainButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            playAgainButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.33),
            playAgainButton.heightAnchor.constraint(equalTo: playAgainButton.widthAnchor, multiplier: 0.36),
            
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(UIScreen.main.bounds.height / 4.1)),
            
            littleCoinImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 11),
            littleCoinImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 30),
            
            littleRewardCoinImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 8),
            littleRewardCoinImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 19),
            
            totalStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            totalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(UIScreen.main.bounds.height / 6)),
            totalStack.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 10),
            
            totalRewardStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            totalRewardStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(UIScreen.main.bounds.height / 4)),
            totalRewardStack.heightAnchor.constraint(equalTo: crown.heightAnchor)
        ])
    }
}
