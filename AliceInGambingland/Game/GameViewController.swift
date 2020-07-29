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
    private var gameStartView: GameStartView?
    private var gameSpinnerView: GameSpinnerView?
    private var viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        gameStartView = GameStartView()
        gameSpinnerView = GameSpinnerView()
        self.view = gameStartView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }
    
    // MARK: - Methods
    private func addTarget() {
        self.gameStartView?.myKingChip.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(targetForTrans)))
        
        self.gameSpinnerView?.fortuneWheel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(targetForSpin)))
    }
    // MARK: - @objc methods
    @objc
    private func targetForTrans() {
        self.view = gameSpinnerView
    }
    
    @objc
    private func targetForSpin() {
            UIView.animate(withDuration: 3) {
                self.gameSpinnerView?.fortuneWheel.transform = CGAffineTransform(rotationAngle: 10000)
        }
    }
}
