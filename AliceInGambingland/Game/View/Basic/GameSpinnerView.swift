//
//  GameTutorialView.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 29.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class GameSpinnerView: GameStartView {
    // MARK: - UI
    lazy var goldenOverlay: UIImageView = {
        let overlay = UIImageView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.image = UIImage(named: "GoldenOverlay")
        return overlay
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
        self.addSubview(goldenOverlay)
        
        arrow.removeFromSuperview()
        fortuneWheel.removeFromSuperview()
        
        self.addSubview(fortuneWheel)
        self.addSubview(arrow)
        
        self.leftPlayer.isHidden = true
        self.rightPlayer.isHidden = true
        self.turnLabel.isHidden = true
        self.arrowTurnLeft.isHidden = true
        self.arrowTurnRight.isHidden = true
        
        NSLayoutConstraint.activate([
            goldenOverlay.topAnchor.constraint(equalTo: self.topAnchor),
            goldenOverlay.leftAnchor.constraint(equalTo: self.leftAnchor),
            goldenOverlay.rightAnchor.constraint(equalTo: self.rightAnchor),
            goldenOverlay.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            fortuneWheel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(UIScreen.main.bounds.width / 10)),
            fortuneWheel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fortuneWheel.heightAnchor.constraint(equalTo: self.fortuneWheel.widthAnchor),
            fortuneWheel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            
            arrow.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            arrow.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(UIScreen.main.bounds.width / 2.075)),
            arrow.widthAnchor.constraint(equalTo: arrow.heightAnchor),
            arrow.widthAnchor.constraint(equalTo: fortuneWheel.widthAnchor, multiplier: 0.35),
        ])
    }

}
