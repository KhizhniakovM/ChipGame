//
//  ViewController.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {
    // MARK: - Properties
    private var chooseColorView = ChooseColorView()
    private var chooseDefendersView = ChooseDefendersView()
    private var viewModel: ChooseViewModel
    
    // MARK: - Initializer
    init(viewModel: ChooseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.view = chooseColorView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    // MARK: - Methods
    private func setupButtons() {
        self.chooseColorView.nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(targetForNextButton)))
        self.chooseColorView.whiteButton.addTarget(self, action: #selector(targetForColorButton), for: .touchUpInside)
        self.chooseColorView.redButton.addTarget(self, action: #selector(targetForColorButton), for: .touchUpInside)
        
        self.chooseDefendersView.chooseFirstDefender.upButton.addTarget(self, action: #selector(targetForUpButton), for: .touchUpInside)
        self.chooseDefendersView.chooseFirstDefender.downButton.addTarget(self, action: #selector(targetForDownButton), for: .touchUpInside)
        self.chooseDefendersView.chooseSecondDefender.upButton.addTarget(self, action: #selector(targetForUpButton), for: .touchUpInside)
        self.chooseDefendersView.chooseSecondDefender.downButton.addTarget(self, action: #selector(targetForDownButton), for: .touchUpInside)
        self.chooseDefendersView.chooseThirdDefender.upButton.addTarget(self, action: #selector(targetForUpButton), for: .touchUpInside)
        self.chooseDefendersView.chooseThirdDefender.downButton.addTarget(self, action: #selector(targetForDownButton), for: .touchUpInside)
        
        self.chooseDefendersView.nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toPlayVC)))
    }
    
    private func changeColor(defender: ChooseDefenderView) {
        if defender.choosenColor == .white {
            defender.downButton.isEnabled = false
            defender.upButton.isEnabled = true
            defender.imageView.image = UIImage(named: "RedColor")
            defender.upButton.setBackgroundImage(UIImage(named: "ArrowUpActive"), for: .normal)
            defender.downButton.setBackgroundImage(UIImage(named: "ArrowDownPassive"), for: .normal)
            defender.choosenColor = .red
        } else {
            defender.upButton.isEnabled = false
            defender.downButton.isEnabled = true
            defender.imageView.image = UIImage(named: "WhiteColor")
            defender.upButton.setBackgroundImage(UIImage(named: "ArrowUpPassive"), for: .normal)
            defender.downButton.setBackgroundImage(UIImage(named: "ArrowDownActive"), for: .normal)
            defender.choosenColor = .white
        }
    }
    
    // MARK: - @objc methods
    @objc
    private func targetForColorButton(sender: UIButton) {
        self.chooseColorView.nextButton.isHidden = false
        switch sender {
        case self.chooseColorView.redButton:
            if self.chooseColorView.whiteButton.isSelected {
                self.chooseColorView.whiteButton.isSelected.toggle()
            }
            sender.isSelected.toggle()
        default:
            if self.chooseColorView.redButton.isSelected {
                self.chooseColorView.redButton.isSelected.toggle()
            }
            sender.isSelected.toggle()
        }
    }
    
    @objc
    private func targetForNextButton() {
        self.view = chooseDefendersView
    }
    
    @objc
    private func targetForUpButton(sender: UIButton) {
        let firstDef = self.chooseDefendersView.chooseFirstDefender
        let secondDef = self.chooseDefendersView.chooseSecondDefender
        let thirdDef = self.chooseDefendersView.chooseThirdDefender
        
        switch sender {
        case firstDef.upButton:
            changeColor(defender: firstDef)
        case secondDef.upButton:
            changeColor(defender: secondDef)
        case thirdDef.upButton:
            changeColor(defender: thirdDef)
        default:
            fatalError("There is not default button")
        }
        
    }
    
    @objc
    private func targetForDownButton(sender: UIButton) {
        let firstDef = self.chooseDefendersView.chooseFirstDefender
        let secondDef = self.chooseDefendersView.chooseSecondDefender
        let thirdDef = self.chooseDefendersView.chooseThirdDefender
        
        switch sender {
        case firstDef.downButton:
            changeColor(defender: firstDef)
        case secondDef.downButton:
            changeColor(defender: secondDef)
        case thirdDef.downButton:
            changeColor(defender: thirdDef)
        default:
            fatalError("There is not default button")
        }
    }
    
    @objc
    private func toPlayVC() {
        let viewModel = GameViewModel()
        let gameVC = GameViewController(viewModel: viewModel)
        gameVC.modalPresentationStyle = .fullScreen
        gameVC.modalTransitionStyle = .crossDissolve
        
        self.present(gameVC, animated: true) {}
    }
}

