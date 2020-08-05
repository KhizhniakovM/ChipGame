//
//  GameTutorialView.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 29.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class GameSpinnerView: UIView, SpinnerView {
    // MARK: - Properties
    var completion: ((Color) -> Void)?
    
    // MARK: - UI
    lazy var goldenOverlay: UIImageView = {
        let overlay = UIImageView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.image = Constants.goldenOverlay
        return overlay
    }()
    
    lazy var arrow: UIImageView = {
        let arrow = UIImageView()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.image = UIImage(named: "Arrow")
        return arrow
    }()
    
    lazy var fortuneWheel: FortuneWheel = {
        let wheel = FortuneWheel()
        wheel.translatesAutoresizingMaskIntoConstraints = false
        wheel.setupGesture()
        wheel.completion = { self.completion!(wheel.result); self.removeFromSuperview() }
        wheel.image = UIImage(named: "FortuneWheel")
        wheel.isUserInteractionEnabled = true
        return wheel
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
        
        self.addSubview(fortuneWheel)
        self.addSubview(arrow)
        
        NSLayoutConstraint.activate([
            goldenOverlay.topAnchor.constraint(equalTo: self.topAnchor),
            goldenOverlay.leftAnchor.constraint(equalTo: self.leftAnchor),
            goldenOverlay.rightAnchor.constraint(equalTo: self.rightAnchor),
            goldenOverlay.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            fortuneWheel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(UIScreen.main.bounds.width / 10.55)),
            fortuneWheel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -(UIScreen.main.bounds.width / 150)),
            fortuneWheel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.735),
            fortuneWheel.heightAnchor.constraint(equalTo: self.fortuneWheel.widthAnchor),
            
            arrow.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            arrow.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(UIScreen.main.bounds.width / 2.075)),
            arrow.widthAnchor.constraint(equalTo: arrow.heightAnchor),
            arrow.widthAnchor.constraint(equalTo: fortuneWheel.widthAnchor, multiplier: 0.45),
        ])
    }

}
