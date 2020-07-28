//
//  ChooseColor.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

extension UIButton {
    // Button for first screen
    static func makeChooseColorButton(with color: Color) -> UIButton {
        let button = UIButton(type: .custom)
        
        if color == .red {
            button.setBackgroundImage(UIImage(named: "RedColor"), for: .normal)
            button.setBackgroundImage(UIImage(named: "RedChoosen"), for: .selected)
        } else {
            button.setBackgroundImage(UIImage(named: "WhiteColor"), for: .normal)
            button.setBackgroundImage(UIImage(named: "WhiteChoosen"), for: .selected)
        }
        return button
    }
}
