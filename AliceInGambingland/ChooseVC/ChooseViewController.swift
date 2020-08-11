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
    var chooseColorView: ChooseColorView
    var chooseDefendersView: ChooseDefendersView
    var viewModel: ChooseViewModel
    
    // MARK: - Initializer
    init(viewModel: ChooseViewModel, chooseColorView: ChooseColorView, chooseDefendersView: ChooseDefendersView) {
        self.viewModel = viewModel
        self.chooseColorView = chooseColorView
        self.chooseDefendersView = chooseDefendersView
        
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.view = chooseColorView
// To check finish Screen
//        let basic = BasicFinishGameView()
//        basic.totalRewardStack.isHidden = false
//        basic.winnerChip.image = Constants.redChip
//        self.view = basic
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    
    // MARK: - Methods
    func startNewGame() {
        self.view = chooseColorView
    }
    
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
    
    private func changeColor(defender: BasicDefenderView) {
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
            self.viewModel.myChips.king.color = .red
            if self.chooseColorView.whiteButton.isSelected {
                self.chooseColorView.whiteButton.isSelected.toggle()
            }
            sender.isSelected.toggle()
        case self.chooseColorView.whiteButton:
            self.viewModel.myChips.king.color = .white
            if self.chooseColorView.redButton.isSelected {
                self.chooseColorView.redButton.isSelected.toggle()
            }
            sender.isSelected.toggle()
        default:
            fatalError("There is only two buttons")
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
            self.viewModel.myChips.firstDefender.color = .white
        case secondDef.upButton:
            changeColor(defender: secondDef)
            self.viewModel.myChips.secondDefender.color = .white
        case thirdDef.upButton:
            changeColor(defender: thirdDef)
            self.viewModel.myChips.thirdDefender.color = .white
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
            self.viewModel.myChips.firstDefender.color = .red
        case secondDef.downButton:
            changeColor(defender: secondDef)
            self.viewModel.myChips.secondDefender.color = .red
        case thirdDef.downButton:
            changeColor(defender: thirdDef)
            self.viewModel.myChips.thirdDefender.color = .red
        default:
            fatalError("There is not default button")
        }
    }
    
    @objc
    private func toPlayVC() {
        let viewModel = GameViewModel()
        viewModel.myChips = self.viewModel.myChips
        viewModel.enemyChips = self.viewModel.enemyChips
        viewModel.chipper = Chipper()
        
        let gameVC = GameViewController(viewModel: viewModel,
                                        gameStartView: GameStartView())
        gameVC.modalPresentationStyle = .fullScreen
        gameVC.modalTransitionStyle = .crossDissolve
        
        self.present(gameVC, animated: true) {}
    }
}
