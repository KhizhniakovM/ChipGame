//
//  GameViewController.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    // MARK: - Properties
    private var gameStartView: GameStartView
    private var gameSpinnerView: SpinnerView?
    private var viewModel: GameViewModel
    
    // MARK: - Initializer
    init(viewModel: GameViewModel, gameStartView: GameStartView) {
        self.viewModel = viewModel
        self.gameStartView = gameStartView
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        addCompletionForStartView()
        setupChips()
        setupPlayerColor()
        self.view = gameStartView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }
    
    // MARK: - Methods
    private func addTarget() {
        self.gameStartView.myKingChip.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(targetForTrans)))
    }
    
    private func setupChips() {
        guard let chipper = self.viewModel.chipper, let myChips = self.viewModel.myChips, let enemyChips = self.viewModel.enemyChips else { return }
        self.gameStartView.myKingChip.image = chipper.makeChip(of: myChips.king.color)
        self.gameStartView.myFirstDefChip.image = chipper.makeChip(of: myChips.firstDefender.color)
        self.gameStartView.mySecondDefChip.image = chipper.makeChip(of: myChips.secondDefender.color)
        self.gameStartView.myThirdDefChip.image = chipper.makeChip(of: myChips.thirdDefender.color)
        self.gameStartView.enemyKingChip.image = chipper.makeChip(of: enemyChips.king.color)
        self.gameStartView.enemyFirstDefChip.image = chipper.makeChip(of: enemyChips.firstDefender.color)
        self.gameStartView.enemySecondDefChip.image = chipper.makeChip(of: enemyChips.secondDefender.color)
        self.gameStartView.enemyThirdDefChip.image = chipper.makeChip(of: enemyChips.thirdDefender.color)
    }
    
    private func setupPlayerColor() {
        guard let chipper = self.viewModel.chipper, let myChips = self.viewModel.myChips, let enemyChips = self.viewModel.enemyChips else { return }
        self.gameStartView.leftPlayer.image = chipper.makePlayerColor(of: myChips.king.color)
        self.gameStartView.rightPlayer.image = chipper.makePlayerColor(of: enemyChips.king.color)
    }
    
    private func deleteDeathChips(from group: Group, from state: Int) {
        self.gameStartView.addBoomToDiedChip(from: group, state: state)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            switch state {
            case 1:
                if group == .player {
                    self.gameStartView.myFirstDefChip.isHidden = true
                } else {
                    self.gameStartView.enemyFirstDefChip.isHidden = true
                }
            case 2:
                if group == .player {
                    self.gameStartView.mySecondDefChip.isHidden = true
                } else {
                    self.gameStartView.enemySecondDefChip.isHidden = true
                }
            case 3:
                if group == .player {
                    self.gameStartView.myThirdDefChip.isHidden = true
                } else {
                    self.gameStartView.enemyThirdDefChip.isHidden = true
                }
            case 4:
                self.gameStartView.deleteAllChipsFromView()
                let finishView = BasicFinishGameView(frame: (self.view.bounds))
                finishView.playAgainButton.addTarget(self, action: #selector(self.playAgain), for: .touchUpInside)
                if group == .player {
                    self.viewModel.winner = self.viewModel.enemyChips?.king.color
                    finishView.darkenOverlay.isHidden = false
                    finishView.winnerChip.image = self.viewModel.chipper?.makeChip(of: self.viewModel.winner!)
                    let count = self.viewModel.goldenChips
                    finishView.totalLabel.text = "TOTAL: " + String(count) + " "
                    self.view.addSubview(finishView)
                } else {
                    self.viewModel.winner = self.viewModel.myChips?.king.color
                    self.viewModel.goldenChips += 200
                    finishView.goldenOverlay.isHidden = false
                    finishView.totalRewardStack.isHidden = false
                    finishView.winnerChip.image = self.viewModel.chipper?.makeChip(of: self.viewModel.winner!)
                    finishView.textLabel.text = "YOU'RE WIN! "
                    let count = self.viewModel.goldenChips
                    finishView.totalLabel.text = "TOTAL: " + String(count) + " "
                    self.view.addSubview(finishView)
                }
            default:
                print("Only 4 states")
            }
        }
    }
    
    private func completionForSpinner(color: Color) {
        self.viewModel.chipToKill = color
        self.gameStartView.completionForSpinner()
    }
    
    private func addCompletionForStartView() {
        gameStartView.completion = { [weak self] in
            guard let self = self else { return }
            self.viewModel.chipToKill = $0
            self.gameStartView.arrowTurnRight.isHidden = true
            self.gameStartView.arrowTurnLeft.isHidden = false
            guard var myChips = self.viewModel.myChips else { return }
            self.viewModel.checkChips(color: $0, group: &myChips, completion: { [weak self] in
                guard let self = self else { return }
                self.deleteDeathChips(from: .player, from: $0)
            })
            self.viewModel.myChips = myChips
            self.view.isUserInteractionEnabled = true
        }
    }
    
    // MARK: - @objc methods
    @objc
    private func targetForTrans() {
        self.gameStartView.prepareForTransitionToSpinner()
        
        if self.viewModel.showTutorial == false {
            gameSpinnerView = GameSpinnerTutorialView(frame: self.view.bounds)
            gameSpinnerView?.completion = { [weak self] in
                guard let self = self else { return }
                self.viewModel.showTutorial = true
                self.completionForSpinner(color: $0)
                guard var enemyChips = self.viewModel.enemyChips else { return }
                self.viewModel.checkChips(color: $0, group: &enemyChips, completion: { [weak self] in
                    guard let self = self else { return }
                    self.deleteDeathChips(from: .enemy, from: $0)
                })
                self.viewModel.enemyChips = enemyChips
                self.view.isUserInteractionEnabled = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                    self?.gameStartView.fortuneWheel.spin()
                }
            }
            UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: { [weak self] in
                self?.view.addSubview(self!.gameSpinnerView as! UIView)
            })
        } else {
            gameSpinnerView = GameSpinnerView(frame: self.view.bounds)
            gameSpinnerView?.completion = { [weak self] in
                guard let self = self else { return }
                self.completionForSpinner(color: $0)
                guard var enemyChips = self.viewModel.enemyChips else { return }
                self.viewModel.checkChips(color: $0, group: &enemyChips, completion: { [weak self] in
                    guard let self = self else { return }
                    self.deleteDeathChips(from: .enemy, from: $0)
                })
                self.viewModel.enemyChips = enemyChips
                
                if self.viewModel.endOfTheGame == false {
                    self.view.isUserInteractionEnabled = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                        self?.gameStartView.fortuneWheel.spin()
                    }
                }
            }
            UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: { [weak self] in
                guard let self = self else { return }
                self.view.addSubview(self.gameSpinnerView as! UIView)
            })
        }
    }
    
    @objc
    func playAgain(sender: UIButton) {
        self.viewModel.endOfTheGame = false
        let startVC = self.presentingViewController as! ChooseViewController
        startVC.viewModel.chooseEnemyChips()
        startVC.startNewGame()
        
        startVC.dismiss(animated: true, completion: nil)
    }
}
