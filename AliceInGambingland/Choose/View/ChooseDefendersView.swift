//
//  ChooseDefendersView.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class ChooseDefendersView: ChooseView {
    // MARK: - UI
    lazy var chooseLabel = UILabel.makeBangerLabel(withText: "NOW CHOOSE YOUR DEFENDERS: ", font: Constants.Fonts.main, lines: 2)
    lazy var nextButton = UILabel.makeBangerLabel(withText: "PLAY >", font: Constants.Fonts.tertiary, lines: 1)
    
    lazy var chooseFirstDefender = ChooseDefenderView()
    lazy var chooseSecondDefender = ChooseDefenderView()
    lazy var chooseThirdDefender = ChooseDefenderView()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [chooseFirstDefender, chooseSecondDefender, chooseThirdDefender])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupView() {
        nextButton.textAlignment = .left
        
        self.addSubview(chooseLabel)
        self.addSubview(nextButton)
        self.addSubview(stack)
        
        NSLayoutConstraint.activate([
            chooseLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            chooseLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: UIScreen.main.bounds.height / 5),
            chooseLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: UIScreen.main.bounds.width / 3),
            nextButton.topAnchor.constraint(equalTo: self.topAnchor, constant: UIScreen.main.bounds.height / 1.6),
            
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stack.topAnchor.constraint(equalTo: chooseLabel.bottomAnchor, constant: UIScreen.main.bounds.height / 40),
            stack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
            stack.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.275),
        ])
    }
    
}
