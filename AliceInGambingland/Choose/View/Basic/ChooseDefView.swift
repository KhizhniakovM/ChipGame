//
//  Ex+UIView.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class ChooseDefenderView: UIView {
    // MARK: - Properties
    var choosenColor: Color = .white
    // MARK: - UI
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "WhiteColor")
        return imageView
    }()
    
    lazy var upButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "ArrowUpPassive"), for: .normal)
        button.subviews.first?.contentMode = .bottom
        button.isEnabled = false
        return button
    }()
    
    lazy var downButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "ArrowDownActive"), for: .normal)
        button.subviews.first?.contentMode = .top
        return button
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [upButton, imageView, downButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 7.5
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
    
    private func setupView() {
        self.addSubview(stack)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            upButton.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.4),
            upButton.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.1),
            downButton.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.4),
            downButton.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.1),
            
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.leftAnchor.constraint(equalTo: self.leftAnchor),
            stack.rightAnchor.constraint(equalTo: self.rightAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

