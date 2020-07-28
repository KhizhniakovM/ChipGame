//
//  ChooseColorView.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class ChooseColorView: ChooseView {
    // MARK: - UI
    lazy var letStart = UILabel.makeBangerLabel(withText: "LET'S START!", font: Constants.Fonts.secondary, lines: 1)
    lazy var chooseColorLabel = UILabel.makeBangerLabel(withText: "CHOOSE YOUR COLOR:", font: Constants.Fonts.main, lines: 2)
    
    lazy var nextButton = UILabel.makeBangerLabel(withText: "NEXT >", font: Constants.Fonts.tertiary, lines: 1)
    lazy var whiteButton = UIButton.makeChooseColorButton(with: .white)
    lazy var redButton = UIButton.makeChooseColorButton(with: .red)
    
    lazy var colorStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [whiteButton, redButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 20
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
        self.addSubview(letStart)
        self.addSubview(chooseColorLabel)
        self.addSubview(colorStack)
        self.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            letStart.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            letStart.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            
            chooseColorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            chooseColorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            chooseColorLabel.widthAnchor.constraint(equalToConstant: 300),
            
            colorStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            colorStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 400),
            colorStack.widthAnchor.constraint(equalToConstant: 200),
            colorStack.heightAnchor.constraint(equalToConstant: 100),
            
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 600),
        ])
    }
}
