//
//  GameSpinnerTutorialView.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 29.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class GameSpinnerTutorialView: GameSpinnerView {
    // MARK: - UI
    lazy var hand: UIImageView = {
        let hand = UIImageView()
        hand.translatesAutoresizingMaskIntoConstraints = false
        hand.image = UIImage(named: "Hand")
        return hand
    }()
    
    lazy var labelKick: UIImageView = {
        let label = UIImageView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.image = UIImage(named: "Kick")
        return label
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
        self.addSubview(hand)
        self.addSubview(labelKick)
        
        NSLayoutConstraint.activate([
            labelKick.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelKick.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: UIScreen.main.bounds.height / 4.25),
            labelKick.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.325),
            labelKick.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.125),
            
            hand.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: UIScreen.main.bounds.width / 3.7),
            hand.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: UIScreen.main.bounds.height / 4.75),
            hand.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            hand.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15),
        ])
    }
}
