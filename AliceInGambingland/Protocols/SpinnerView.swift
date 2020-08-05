//
//  SpinnerView.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 03.08.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

protocol SpinnerView {
    var goldenOverlay: UIImageView { get set }
    var arrow: UIImageView { get set }
    var fortuneWheel: FortuneWheel { get set }
    
    var completion: ((Color) -> Void)? { get set }
}
